#include <stdlib.h>
#include "myLib.h"
#include "l2WinImage.h"

void l2Win();

extern int state;

void l2Win() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l2WinImagePal);

	flipPage();
	drawBackgroundImage4(l2WinImageBitmap);
	flipPage();
	drawBackgroundImage4(l2WinImageBitmap);

	while(state == L2WIN) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = SPLASH;
		}
	}
}