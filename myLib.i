# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();

void setupSounds();
void playSoundA(const unsigned char* sound, int length, int frequency);
void playSoundB(const unsigned char* sound, int length, int frequency);
void pauseSound();
void unpauseSound();
void stopSound();
void setupInterrupts();
void interruptHandler();
# 95 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 105 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 144 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 238 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 295 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;




void splash();
void l1Instructions();
void levelOne();
void pause();
void l1Win();
void l1Lose();

enum states {SPLASH, L1INSTRUCTIONS, LEVELONE, PAUSE, L1WIN, L1LOSE, L2INSTRUCTIONS, LEVELTWO, L2WIN, L2LOSE};

unsigned int buttons;
unsigned int oldButtons;
# 2 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void setPixel3(int row, int col, unsigned short color)
{
 videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
 unsigned short c = color;

 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, &c, &videoBuffer[((row+i)*(240)+(col))], (width) | (2 << 23));
 }
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
 int i;
 for(i = 0; i < height; i++)
 {
  DMANow(3, (unsigned short*)&image[((i)*(width)+(0))], &videoBuffer[((row+i)*(240)+(col))], (width));
 }
}

void fillScreen3(unsigned short color)
{
 unsigned short c = color;

 DMANow(3, &c, videoBuffer, (240*160) | (2 << 23));

}

void setPixel4(int row, int col, unsigned char colorIndex)
{
 unsigned short pixels = videoBuffer[((row)*(240/2)+(col/2))];

 if(col % 2 == 0)
 {
  pixels &= 0xFF << 8;
  videoBuffer[((row)*(240/2)+(col/2))] = pixels | colorIndex;
 }
 else
 {
  pixels &= 0xFF;
  videoBuffer[((row)*(240/2)+(col/2))] = pixels | colorIndex << 8;
 }
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
 unsigned short pixels = colorIndex << 8 | colorIndex;

 int r;
 for(r = 0; r < height; r++)
 {
  if(col % 2 == 0)
  {
   DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+(col/2))], (width/2) | (2 << 23));
   if(width % 2 == 1)
   {
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }
  else
  {
   setPixel4(row+r, col, colorIndex);

   if(width % 2 == 1)
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], (width/2) | (2 << 23));
   }
   else
   {
    DMANow(3, &pixels, &videoBuffer[((row + r)*(240/2)+((col+1)/2))], ((width/2)-1) | (2 << 23));
    setPixel4(row+r, col+width - 1, colorIndex);
   }
  }
 }

}

void fillScreen4(unsigned char colorIndex)
{
 unsigned short pixels = colorIndex << 8 | colorIndex;
 DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | (2 << 23));
}

void drawBackgroundImage4(const unsigned short* image)
{
 DMANow(3, (unsigned short*)image, videoBuffer, ((240 * 160)/2));
}

void drawImage4(const unsigned short* image, int row, int col, int height, int width)
{
 if(col%2)
 {
  col++;
 }

 int r;
 for(r = 0; r < height; r++)
 {
  DMANow(3, (unsigned short*)&image[((r)*(width/2)+(0))], &videoBuffer[((row + r)*(240/2)+(col/2))], width/2);
 }
}

void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width)
{
 if(sourceCol%2)
 {
  sourceCol++;
 }

 if(col%2)
 {
  col++;
 }

 int r;
 for(r = 0; r < height; r++)
 {
  DMANow(3, (unsigned short*)&sourceImage[((sourceRow + r)*(width/2)+(sourceCol/2))], &videoBuffer[((row + r)*(240/2)+(col/2))], width/2);
 }
}

void loadPalette(const unsigned short* palette)
{
 DMANow(3, (unsigned short*)palette, ((u16 *)0x5000000), 256);
}


void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
 dma[channel].src = source;
 dma[channel].dst = destination;
 dma[channel].cnt = (1 << 31) | control;
}

void waitForVblank()
{
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}


void flipPage()
{
    if(*(unsigned short *)0x4000000 & (1<<4))
    {
        *(unsigned short *)0x4000000 &= ~(1<<4);
        videoBuffer = backBuffer;
    }
    else
    {
        *(unsigned short *)0x4000000 |= (1<<4);
        videoBuffer = frontBuffer;
    }
}




typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
}SOUND;

SOUND soundA;
SOUND soundB;
int vbCountA;
int vbCountB;

void setupSounds()
{
    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                        (1<<2) |
                        (3<<8) |
                        0 |
                        (1<<11) |
                        (1<<3) |
                        (3<<12) |
                        (1<<14) |
                        (1<<15);

 *(u16*)0x04000080 = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {

    dma[1].cnt = 0;
    vbCountA = 0;

    int interval = 16777216/frequency;
 DMANow(1, sound, 0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short*)0x4000102 = 0;

    *(volatile unsigned short*)0x4000100 = -interval;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = sound;
    soundA.length = length;
    soundA.frequency = frequency;
    soundA.isPlaying = 1;
    soundA.duration = 59.727*length/frequency;
    soundA.loops = 1;
    soundA.priority = 0;

    if(soundA.loops) {
     vbCountA;
    }
}


void playSoundB( const unsigned char* sound, int length, int frequency) {

        dma[2].cnt = 0;
        vbCountB = 0;

        int interval = 16777216/frequency;

        DMANow(2, sound, 0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

        *(volatile unsigned short*)0x4000106 = 0;

        *(volatile unsigned short*)0x4000104 = -interval;
        *(volatile unsigned short*)0x4000106 = (1<<7);

        soundB.data = sound;
     soundB.length = length;
     soundB.frequency = frequency;
     soundB.isPlaying = 1;
     soundB.duration = 59.727*length/frequency;
     soundB.loops = 1;
     soundB.priority = 0;

        if(soundB.loops) {
         vbCountB++;
        }
}

void pauseSound()
{
    *(volatile u16*)0x04000082 = *(volatile u16 *)0x04000084 & (3<<8);
}

void unpauseSound()
{
 *(volatile u16*)0x04000082 = *(volatile u16 *)0x04000084 | (3<<8);
}

void stopSound()
{
    *(volatile u16*)0x04000082 = (1<<11);
}

void setupInterrupts()
{
 *(unsigned short*)0x4000208 = 0;
 *(unsigned int*)0x3007FFC = (unsigned int)interruptHandler;
 *(unsigned short*)0x4000200 |= 1 << 0;
 *(unsigned short*)0x4000004 |= 1 << 3;
 *(unsigned short*)0x4000208 = 1;
}

void interruptHandler()
{
 *(unsigned short*)0x4000208 = 0;
 if(*(volatile unsigned short*)0x4000202 & 1 << 0)
 {
  vbCountB++;
  if((vbCountB > vbCountA+soundB.duration) && soundB.isPlaying) {
   dma[1].cnt = 0;
   *(volatile unsigned short*)0x4000102 = 0;
   soundA.isPlaying = 0;

   if(soundB.loops == 1) {
    playSoundA(soundB.data, soundB.length, soundB.frequency);
   }
  }

  *(volatile unsigned short*)0x4000202 = 1 << 0;
 }

 *(unsigned short*)0x4000208 = 1;
}
