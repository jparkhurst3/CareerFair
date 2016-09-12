#include <stdlib.h>
#include "myLib.h"
#include "l1WinImage.h"

void l1Win();

extern int state;

void l1Win() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l1WinImagePal);

	flipPage();
	drawBackgroundImage4(l1WinImageBitmap);
	flipPage();
	drawBackgroundImage4(l1WinImageBitmap);

	while(state == L1WIN) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = LEVELONE;
		}
		if(BUTTON_HELD(BUTTON_START)) {
			state = L2INSTRUCTIONS;
		}
	}
}