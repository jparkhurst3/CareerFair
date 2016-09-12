# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 27 "main.c"
int state = SPLASH;
int prevState;

int main() {
 while(1) {
  oldButtons = buttons;
  buttons = *(volatile unsigned int *)0x04000130;
  switch(state) {
   case SPLASH:
    splash();
    break;
   case L1INSTRUCTIONS:
    l1Instructions();
    break;
   case LEVELONE:
    levelOne();
    break;
   case PAUSE:
    pause();
    break;
   case L1WIN:
    l1Win();
    break;
   case L1LOSE:
    l1Lose();
    break;
   case L2INSTRUCTIONS:
    l2Instructions();
    break;
   case LEVELTWO:
    levelTwo();
    break;
   case L2WIN:
    l2Win();
    break;
   case L2LOSE:
    l2Lose();
    break;
  }
  waitForVblank();
     flipPage();
 }
 return 0;
}
