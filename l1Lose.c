#include <stdlib.h>
#include "myLib.h"
#include "l1LoseImage.h"

void l1Lose();

extern int state;

void l1Lose() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l1LoseImagePal);

	flipPage();
	drawBackgroundImage4(l1LoseImageBitmap);
	flipPage();
	drawBackgroundImage4(l1LoseImageBitmap);

	while(state == L1LOSE) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = LEVELONE;
		}
	}
}