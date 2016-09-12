#include <stdlib.h>
#include "myLib.h"
#include "splashImage.h"

void splash();

extern int state;

void splash() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(splashImagePal);

	flipPage();
	drawBackgroundImage4(splashImageBitmap);
	flipPage();
	drawBackgroundImage4(splashImageBitmap);

	while(state == SPLASH) {
		if(BUTTON_HELD(BUTTON_START)) {
			state = L1INSTRUCTIONS;
		}
	}
}