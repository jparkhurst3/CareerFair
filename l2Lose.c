#include <stdlib.h>
#include "myLib.h"
#include "l1LoseImage.h"

void l2Lose();

extern int state;

void l2Lose() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l1LoseImagePal);

	flipPage();
	drawBackgroundImage4(l1LoseImageBitmap);
	flipPage();
	drawBackgroundImage4(l1LoseImageBitmap);

	while(state == L2LOSE) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = SPLASH;
		}
	}
}