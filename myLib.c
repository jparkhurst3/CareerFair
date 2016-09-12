#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void setPixel3(int row, int col, unsigned short color)
{
	videoBuffer[OFFSET(row, col, SCREENWIDTH)] = color;
}

void drawRect3(int row, int col, int height, int width, unsigned short color)
{
	unsigned short c = color;
	
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, &c, &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width) | DMA_SOURCE_FIXED);
	}
}

void drawImage3(const unsigned short* image, int row, int col, int height, int width)
{
	int i;
	for(i = 0; i < height; i++)
	{
		DMANow(3, (unsigned short*)&image[OFFSET(i,0, width)], &videoBuffer[OFFSET(row+i, col, SCREENWIDTH)], (width));
	}
}

void fillScreen3(unsigned short color)
{
	unsigned short c = color;

	DMANow(3, &c, videoBuffer, (240*160) | DMA_SOURCE_FIXED);
	
}

void setPixel4(int row, int col, unsigned char colorIndex)
{
	unsigned short pixels = videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)];

	if(col % 2 == 0) // even
	{
		pixels &= 0xFF << 8;
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = pixels | colorIndex;
	}
	else // odd
	{
		pixels &= 0xFF;
		videoBuffer[OFFSET(row, col/2, SCREENWIDTH/2)] = pixels | colorIndex << 8;
	}
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex)
{
	unsigned short pixels = colorIndex << 8 | colorIndex;

	int r;
	for(r = 0; r < height; r++)
	{
		if(col % 2 == 0) // even starting col
		{
			DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);	
			if(width % 2 == 1) // if width is odd
			{
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
		else // old starting col
		{
			setPixel4(row+r, col, colorIndex);

			if(width % 2 == 1) // if width is odd
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], (width/2) | DMA_SOURCE_FIXED);
			}
			else  // width is even
			{
				DMANow(3, &pixels, &videoBuffer[OFFSET(row + r, (col+1)/2, SCREENWIDTH/2)], ((width/2)-1) | DMA_SOURCE_FIXED);
				setPixel4(row+r, col+width - 1, colorIndex);
			}
		}
	}
	
}

void fillScreen4(unsigned char colorIndex)
{
	unsigned short pixels = colorIndex << 8 | colorIndex;
	DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | DMA_SOURCE_FIXED);
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
		DMANow(3, (unsigned short*)&image[OFFSET(r,0,width/2)], &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)], width/2);
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
		DMANow(3, (unsigned short*)&sourceImage[OFFSET(sourceRow + r, sourceCol/2,width/2)], &videoBuffer[OFFSET(row + r, col/2, SCREENWIDTH/2)], width/2);
	}
}

void loadPalette(const unsigned short* palette)
{
	DMANow(3, (unsigned short*)palette, PALETTE, 256);
}


void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}


void flipPage()
{
    if(REG_DISPCTL & BACKBUFFER)
    {
        REG_DISPCTL &= ~BACKBUFFER;
        videoBuffer = backBuffer;
    }
    else
    {
        REG_DISPCTL |= BACKBUFFER;
        videoBuffer = frontBuffer;
    }
}

//////////////////////////////////////////////////////////
//SOUNDS

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
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_RATIO_100 | 
                        DSA_OUTPUT_TO_BOTH | 
                        DSA_TIMER0 | 
                        DSA_FIFO_RESET |
                        DSB_OUTPUT_RATIO_100 | 
                        DSB_OUTPUT_TO_BOTH | 
                        DSB_TIMER1 | 
                        DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency) {
	
    dma[1].cnt = 0;
    vbCountA = 0;
	
    int interval = 16777216/frequency;
	DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
    REG_TM0CNT = 0;
	
    REG_TM0D = -interval;
    REG_TM0CNT = TIMER_ON;   

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

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -interval;
        REG_TM1CNT = TIMER_ON;

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
    REG_SOUNDCNT_H = REG_SOUNDCNT_X & DSA_OUTPUT_TO_BOTH;
}

void unpauseSound()
{
	REG_SOUNDCNT_H = REG_SOUNDCNT_X | DSA_OUTPUT_TO_BOTH;
}

void stopSound()
{
    REG_SOUNDCNT_H = DSA_FIFO_RESET;
}

void setupInterrupts()
{
	REG_IME = 0;
	REG_INTERRUPT = (unsigned int)interruptHandler;
	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{
		vbCountB++;
		if((vbCountB > vbCountA+soundB.duration) && soundB.isPlaying) {
			dma[1].cnt = 0;
			REG_TM0CNT = 0;
			soundA.isPlaying = 0;

			if(soundB.loops == 1) {
				playSoundA(soundB.data, soundB.length, soundB.frequency);
			}
		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}