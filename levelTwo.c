#include <stdlib.h>
#include "myLib.h"
#include "levelTwoImage.h"
#include "spriteSheet.h"
#include "missionImpossible.h"
#include "dodgingSound.h"

#define ROWMASK 0xFF
#define COLMASK 0x1FF

void initialize();
void levelTwo();
void hideSprites();
void loadBackground();
void drawRecruiters();
void drawPlayer();
void drawGameClock();
void drawResumes(int);
void drawBill();
void checkForCollision();

//CONSTANTS
extern int state;
extern int prevState;
OBJ_ATTR shadowOAM[128];
int numRecruiters = 13;
int hOff;
int vOff;
int numBadRecruitersFound;
int numGoodRecruitersFound;
int drawAllResumesFirst;
int gameClockCounter;
int billReached;

//STRUCTS FOR SPRITES
typedef struct  
{
	int row;
	int col;
	int bigRow;
	int bigCol;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int currFrame;
} MOVOBJ;
MOVOBJ player;
enum { PLAYERFRONT, PLAYERBACK, PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};

typedef struct {
	int bigRow;
	int bigCol;
	int row; 
	int col;
	int width;
	int height;
	int counter;
	int type; //0 is bad recruiter, 1 is good recruiter
	int alive; //0 is alive or active, 1 is dead or inactive
} RECRUITER;
RECRUITER recruiters[13];

typedef struct {
	int bigRow;
	int bigCol;
	int row;
	int col;
	int width;
	int height;
	int counter;
	int type; //0 is noon, 1 is 1:00, ..., 5 is 5:00
} CLOCK;
CLOCK gameClock;

typedef struct {
	int bigRow; 
	int bigCol;
	int row;
	int col; 
	int width;
	int height;
	int type; //0 is still have, 1 is given away
} RESUME;
RESUME resumes[3];

typedef struct {
	int bigRow;
	int bigCol;
	int row; 
	int col;
	int width;
	int height;
} BILL;
BILL bill;

void levelTwo() {
	initialize();

	while(state == LEVELTWO) {

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
			player.aniState = PLAYERBACK;
			if(player.row > 160/2-player.width/2) { //If player is on bottom half of screen, move up to center
				player.row--;
			} else { 
				if(vOff > 0) { //If background top isn't at top of screen
					vOff--; //Move background 
					for(int i=0; i<numRecruiters; i++) { //Move recruiters with background
						recruiters[i].row++;
					}
					bill.row++;
				} else { //If backgournd top IS at top of screen
					if(player.row > 5) { //If not at top yet, move player up
						player.row--;
					}
				}
			}
		}

		if(BUTTON_HELD(BUTTON_DOWN)) {
			player.aniState = PLAYERFRONT;			
			if(player.row < 160/2-player.width/2) {
				player.row++;
			} else {
				if(vOff < 96) {
					vOff++;
					for(int i=0; i<numRecruiters; i++) {
						recruiters[i].row--;
					}
					bill.row--;
				} else {
					if(player.row < 140) {
						player.row++;
					}
				}
			}
		}

		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.aniState = PLAYERLEFT;
			if(player.col > 240/2-player.height/2) {
				player.col--;
			} else {
				if(hOff > 0) {
					hOff--;
					for(int i=0; i<numRecruiters; i++) {
						recruiters[i].col++;
					}
					bill.col++;
				} else {
					if(player.col > 1) {
						player.col--;
					}
				}
			}
		}

		if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.aniState = PLAYERRIGHT;
			if(player.col < 240/2-player.height/2) {
				player.col++;
			} else {
				if(hOff < 16) {
					hOff++;
					for(int i=0; i<numRecruiters; i++) {
						recruiters[i].col--;
					}
					bill.col--;
				} else {
					if(player.col < 225) {
						player.col++;
					}
				}
			}
		}

		if(BUTTON_HELD(BUTTON_START)) {
			pauseSound();
			prevState = LEVELTWO;
			state = PAUSE;
		}

		if(BUTTON_HELD(BUTTON_B)) {//Shortcut to win (testing purposes)
			state = L2WIN;
		}

		if(BUTTON_HELD(BUTTON_R)) {//Shortcut to win (testing purposes)
			state = L2LOSE;
		}

		if(player.aniState == PLAYERIDLE) {
			player.currFrame = 0;
			player.aniState = player.prevAniState;
		} else {
			player.aniCounter++;
		}

		drawRecruiters();
		drawPlayer();
		drawGameClock();
		drawBill();
		checkForCollision();
		waitForVblank();
	}
 }

void loadBackground(){
    loadPalette(levelTwoImagePal); //Load Background Palette
    DMANow(3, levelTwoImageTiles, &CHARBLOCKBASE[0], (levelTwoImageTilesLen/2)); //Load Background Image
    DMANow(3, levelTwoImageMap, &SCREENBLOCKBASE[27], (levelTwoImageMapLen/2)); //Load Background Map
}

void hideSprites() {
	for (int i=0; i<128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

void initialize() {
	oldButtons = buttons;
	buttons = BUTTONS;
	hOff = 9;
	vOff = 96;
	numBadRecruitersFound = 0;
	numGoodRecruitersFound = 0;
	gameClockCounter = 0;
	billReached = 0;

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	REG_BG0CNT = CBB(0) | SBB(27) | BG_SIZE3 | COLOR256;

	loadBackground();

	DMANow(3, spriteSheetPal, SPRITE_PALETTE, 16);
    DMANow(3, spriteSheetTiles, &CHARBLOCKBASE[4], (spriteSheetTilesLen/2));
        
    setupInterrupts();
    setupSounds();
	hideSprites();

	player.width = 32;
	player.height = 32;
	player.rdel = 1;
	player.cdel = 1;
	player.row = 160/2 - player.width/2;
	player.col = 240/2 - player.height/2;
	player.bigRow = player.row + vOff;
	player.bigCol = player.col + vOff;
	player.aniCounter = 0;
	player.currFrame = 0;
	player.aniState = PLAYERFRONT;

	bill.bigRow = rand()%256;
	bill.bigCol = rand()%256;
	bill.row = bill.bigRow - vOff;
	bill.col = bill.bigCol - hOff;
	bill.width = 32;
	bill.height = 32;

	for(int i=0; i<numRecruiters; i++) {
		recruiters[i].bigRow = rand()%256;
        recruiters[i].bigCol = rand()%256;
		recruiters[i].row = recruiters[i].bigRow - vOff;
		recruiters[i].col = recruiters[i].bigCol - hOff;
        recruiters[i].width = 32;
        recruiters[i].height = 32;
        recruiters[i].counter = 0;
        recruiters[i].alive = 0;
        if(i<9) {
        	recruiters[i].type = 0;
        } else if(i<numRecruiters) {
        	recruiters[i].type = 1;
        }
	}

	gameClock.width = 32;
	gameClock.height = 16;
	gameClock.row = 2;
	gameClock.col = 2;
	gameClock.counter = 0;
	gameClock.type = 0;
	drawGameClock();

	for(int i=0; i<3; i++) {
		resumes[i].width = 16;
		resumes[i].height = 16;
		resumes[i].row = 2;
		resumes[i].col = 36 + (20*i);
		resumes[i].type = 0;
	}
	drawAllResumesFirst = 0;
	drawResumes(0);
}

void drawRecruiters() {
	//draw bad recruiters
	for(int i=0; i<(numRecruiters-3); i++) {
		shadowOAM[5+i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (ROWMASK & recruiters[i].row);
		shadowOAM[5+i].attr1 = ATTR1_SIZE32 | (COLMASK & recruiters[i].col);
		if(recruiters[i].alive == 0) {
			recruiters[i].counter++;
			if(recruiters[i].counter%200 == 0) {
				shadowOAM[5+i].attr2 = SPRITEOFFSET16(4, 24);
			} else {
				shadowOAM[5+i].attr2 = SPRITEOFFSET16(0, 24);
			}
		}
	}
	//draw good recruiters
	for(int i=(numRecruiters-3); i<numRecruiters; i++) {
		shadowOAM[5+i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (ROWMASK & recruiters[i].row);
		shadowOAM[5+i].attr1 = ATTR1_SIZE32 | (COLMASK & recruiters[i].col);
		if(recruiters[i].alive == 0) {
			if(recruiters[i].counter%200 == 0) {
				shadowOAM[5+i].attr2 = SPRITEOFFSET16(4, 28);
			} else {
				shadowOAM[5+i].attr2 = SPRITEOFFSET16(0, 28);
			}
		}
	}
}

void drawPlayer() {
	shadowOAM[0].attr0 = ATTR0_SQUARE | player.row;
	shadowOAM[0].attr1 = ATTR1_SIZE32 | player.col;
	shadowOAM[0].attr2 = SPRITEOFFSET16(player.currFrame*2, player.aniState*4);
	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;
	DMANow(3, &shadowOAM[0], OAM, (128*4));
}

void drawGameClock() {
	if(billReached == 1) {
		return;
	}
	gameClockCounter++;
	if(gameClockCounter%180 == 0) {
		gameClock.type = gameClockCounter / 180;
	}
	if(gameClock.type > 4) {
		state = L2LOSE;
	}
	shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | gameClock.row;
	shadowOAM[1].attr1 = ATTR1_SIZE32 | gameClock.col;
	shadowOAM[1].attr2 = SPRITEOFFSET16((gameClock.type*2)+6, 20);
}

void drawResumes(int numResumes) {
	if(drawAllResumesFirst == 0) {
		for(int i=0; i<3; i++) {
			shadowOAM[2+i].attr0 = ATTR0_4BPP | ATTR0_SQUARE | resumes[i].row;
			shadowOAM[2+i].attr1 = ATTR1_SIZE16 | resumes[i].col;
			shadowOAM[2+i].attr2 = SPRITEOFFSET16(4, 20);		
		}
		drawAllResumesFirst = 1;
	} else {
		for(int j=0; j<numResumes; j++) {
			shadowOAM[2+j].attr0 = ATTR0_4BPP | ATTR0_SQUARE | resumes[j].row;
			shadowOAM[2+j].attr1 = ATTR1_SIZE16 | resumes[j].col;
			shadowOAM[2+j].attr2 = SPRITEOFFSET16(4, 22);
		}
	}
}

void drawBill() {
	shadowOAM[19].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (ROWMASK & bill.row);
	shadowOAM[19].attr1 = ATTR1_SIZE32 | (COLMASK & bill.col);
	shadowOAM[19].attr2 = SPRITEOFFSET16(8,28);
}

void checkForCollision() {
	for(int i=0; i<13; i++) { //For each recruiter
		if(recruiters[i].alive == 0) { //If that recruiter is active
			int isColliding = 0;
			if((recruiters[i].col-player.width+10) < player.col) {
				isColliding++;
			}
			if((recruiters[i].col+recruiters[i].width-10) > player.col) {
				isColliding++;
			}
			if((recruiters[i].row+recruiters[i].height) > player.row) {
				isColliding++;
			} 
			if((recruiters[i].row-player.height) < player.row) {
				isColliding++;
			}
			if(isColliding > 3) { //If player within recruiter's boundary
				recruiters[i].alive = 1;
				if(recruiters[i].type == 0) { //If recruiter is enemy
					numBadRecruitersFound++;
					gameClockCounter += 170;
					drawGameClock();
					if(numBadRecruitersFound > 2) {
						state = L1LOSE;
					}
				} else { //If recruiter is friendly
					numGoodRecruitersFound++;
					drawResumes(numGoodRecruitersFound);
					if(numGoodRecruitersFound > 2) {
						state = L2WIN;
					}
				}
				playSoundB(dodgingSound, DODGINGSOUNDLEN, DODGINGSOUNDFREQ);
			}
		}
	}
	int hitBill = 0;
	if((bill.col-player.width+10) < player.col) {
		hitBill++;
	}
	if((bill.col+bill.width-10) > player.col) {
		hitBill++;
	}
	if((bill.row+bill.height) > player.row) {
		hitBill++;
	} 
	if((bill.row-player.height) < player.row) {
		hitBill++;
	}
	if(hitBill > 3) {
		billReached = 1;
	}
}