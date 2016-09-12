#include <stdlib.h>
#include "myLib.h"
#include "levelOneCloserImage.h"
#include "levelOneFurtherImage.h"
#include "spriteSheet.h"
#include "missionImpossible.h"
#include "dodgingSound.h"

void initializeLevelOne();
void checkButtons();
void drawSprites();
void checkForCollisions();

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0xFF
#define COLMASK 0x1FF

typedef struct  
{
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
    int hit;
} MOVOBJ;

MOVOBJ player;

typedef struct {
	int row; 
	int col;
	int cdel;
	int alive;
	int counter;
} BIKER;

BIKER biker;

typedef struct{
	int row; 
	int col;
	int cdel;
	int alive;
	int counter;
} FLYER;

FLYER flyer1;
FLYER flyer2;

void levelOne();
void hideSprites();

enum {PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERDODGE, PLAYERIDLE};

extern int state;
extern int prevState = LEVELONE;
int hOff;
int vOff;
int lives;
int distanceRun;
int enemyCounter;

void levelOne() {
	initializeLevelOne();

	while(state == LEVELONE) {
		checkButtons();
		checkForCollisions();
		drawSprites();		
		waitForVblank();
	}
}

void initializeLevelOne() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);  //Closer
	REG_BG1CNT = BG_SIZE1 | CBB(1) | SBB(27);  //Further

	loadPalette(levelOneCloserImagePal);

	DMANow(3, levelOneCloserImageTiles, &CHARBLOCKBASE[0], (levelOneCloserImageTilesLen/2) | DMA_ON);
	DMANow(3, levelOneCloserImageMap, &SCREENBLOCKBASE[30], (levelOneCloserImageMapLen/2) | DMA_ON);
	
	DMANow(3, levelOneFurtherImageTiles, &CHARBLOCKBASE[1], (levelOneFurtherImageTilesLen/2) | DMA_ON);
	DMANow(3, levelOneFurtherImageMap, &SCREENBLOCKBASE[27], (levelOneFurtherImageMapLen/2) | DMA_ON);
	
	DMANow(3, spriteSheetPal, SPRITE_PALETTE, 16);
    DMANow(3, spriteSheetTiles, &CHARBLOCKBASE[4], (spriteSheetTilesLen/2));

    hideSprites();
    setupInterrupts();
    setupSounds();

    playSoundA(missionImpossible, MISSIONIMPOSSIBLELEN, MISSIONIMPOSSIBLEFREQ);

    player.width = 32;
	player.height = 32;
	player.rdel = 1;
	player.cdel = 1;
	player.row = 110;
	player.col = 240/2 - player.height/2;
	player.aniCounter = 0;
	player.currFrame = 0;
	player.aniState = PLAYERFRONT;
	player.hit = 0;

	biker.row = 120;
	biker.col = 200;
	biker.alive = 0;
	biker.cdel = 3;
	biker.counter = 0;

	flyer1.row = 125;
	flyer1.col = 200;
	flyer1.alive = 0;
	flyer1.cdel = player.cdel;
	flyer1.counter = 0;

	flyer2.row = 125;
	flyer2.col = 200;
	flyer2.alive = 0;
	flyer2.cdel = player.cdel;
	flyer2.counter = 0;

	hOff = 0; 
	vOff = 90;
	buttons = BUTTONS;

	lives = 3;
	distanceRun = 0;
	enemyCounter = 0;
}

//THIS METHOD CHECKS THE BUTTONS
// AND MOVES THE BACKGROUNDS/PLAYER ACCORDINGLY
void checkButtons() {
	oldButtons = buttons;
	buttons = BUTTONS;
	if(player.aniState != PLAYERIDLE) {
		player.prevAniState = player.aniState;
	}
	if(!((BUTTON_HELD(BUTTON_UP)) && (BUTTON_HELD(BUTTON_DOWN)) && (BUTTON_HELD(BUTTON_LEFT)) && (BUTTON_HELD(BUTTON_RIGHT)))) {
		player.aniState = PLAYERIDLE;
	}
	if(player.aniCounter % 20 == 0) {
		player.currFrame += 2;
		if(player.currFrame == 4) {
			player.currFrame = 0;
		}
	}
	if(BUTTON_HELD(BUTTON_UP)) {
		player.aniState = PLAYERDODGE;
		playSoundB(dodgingSound, DODGINGSOUNDLEN, DODGINGSOUNDFREQ);
	}	
	if(BUTTON_HELD(BUTTON_LEFT))
	{
		player.aniState = PLAYERLEFT;
		hOff = hOff - 2;
	}
	if(BUTTON_HELD(BUTTON_RIGHT))
	{
		player.aniState = PLAYERRIGHT;
		hOff = hOff + (player.cdel*2);
		distanceRun += player.cdel;
		if(distanceRun > 1000) {
			state = L1WIN;
		}
	}
	waitForVblank();
	REG_BG0HOFS = hOff;
	REG_BG1HOFS = hOff/2;
	REG_BG0VOFS = vOff;
	REG_BG1VOFS = vOff+45;

	//PAUSE
	if(BUTTON_HELD(BUTTON_START)) {
		pauseSound();
		state = PAUSE;
	}

	//CHEAT BUTTON
	if(BUTTON_HELD(BUTTON_L)) {
		player.cdel = 3;
		player.currFrame = 6;
		player.aniState = 0;
		hOff = hOff + (player.cdel*2);
		distanceRun += player.cdel;
		if(distanceRun > 1000) {
			state = L1WIN;
		}
	}
	if(player.aniState == PLAYERIDLE) {
		player.currFrame = 0;
		player.aniState = player.prevAniState;
	} else {
		player.aniCounter++;
	}
}

void drawSprites() {
	shadowOAM[4].attr0 = ATTR0_SQUARE | player.row;
	shadowOAM[4].attr1 = ATTR1_SIZE32 | player.col;
	shadowOAM[4].attr2 = SPRITEOFFSET16(player.currFrame*2, player.aniState*4);
	DMANow(3, &shadowOAM[0], OAM, (128*4));

	enemyCounter++;
	if(enemyCounter%100 == 0) {
		if(biker.alive == 0) {
			biker.alive = 1;
			biker.col = 240;
		}
	} 
	if (enemyCounter%230 == 0) {
		if(flyer1.alive == 0) {
			flyer1.alive = 1;
			flyer1.col = 240;
		}
	} 
	if(enemyCounter%370 == 0) {
		if(flyer2.alive == 0) {
			flyer2.alive = 1;
			flyer2.col = 240;
		}
	}

	if(biker.alive == 1) {
		biker.col -= (player.cdel*2);
		if(biker.col < 0) {
			biker.alive = 0;
			player.hit = 0;
		} else {
			shadowOAM[0].attr0 = ATTR0_SQUARE | biker.row;
			shadowOAM[0].attr1 = ATTR1_SIZE32 | biker.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 20);
		}
	}

	if(flyer1.alive == 1) {
		flyer1.col-= (player.cdel*2);
		if(flyer1.col < 0) {
			flyer1.alive = 0;
			player.hit = 0;
		} else {
			shadowOAM[1].attr0 = ATTR0_SQUARE | flyer1.row;
			shadowOAM[1].attr1 = ATTR1_SIZE32 | flyer1.col;
			shadowOAM[1].attr2 = SPRITEOFFSET16(8, 24);
		}
	}

	if(flyer2.alive == 1) {
		flyer2.col-= (player.cdel*2);
		if(flyer2.col < 0) {
			flyer2.alive = 0;
			player.hit = 0;
		} else {
			shadowOAM[2].attr0 = ATTR0_SQUARE | flyer2.row;
			shadowOAM[2].attr1 = ATTR1_SIZE32 | flyer2.col;
			shadowOAM[2].attr2 = SPRITEOFFSET16(12, 24);
		}
	}
}

void checkForCollisions() {
	if(player.currFrame == 6) {
		return;
	}

	if(biker.col < (player.col+10)) {
		if(biker.col > (player.col+5)) {
			if(!(player.aniState == PLAYERDODGE)) {
				if(!player.hit) {	
					lives--;
					if(lives < 1) {
						state = L1LOSE;
					}
					player.hit = 1;
				}
			}
		}
	}

	if(flyer1.col < (player.col+10)) {
		if(flyer1.col > (player.col+5)) {
			if(!(player.aniState == PLAYERDODGE)) {
				if(!player.hit) {	
					lives--;
					if(lives < 1) {
						state = L1LOSE;
					}
					player.hit = 1;
				}
			}
		}
	}

	if(flyer2.col < (player.col+10)) {
		if(flyer2.col > (player.col+5)) {
			if(!(player.aniState == PLAYERDODGE)) {
				if(!player.hit) {	
					lives--;
					if(lives < 1) {
						state = L1LOSE;
					}
					player.hit = 1;
				}
			}
		}
	}
}