#include <stdlib.h>
#include "myLib.h"
#include "l1InstructionsImage.h"

void l1Instructions();

extern int state;

void l1Instructions() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l1InstructionsImagePal);

	flipPage();
	drawBackgroundImage4(l1InstructionsImageBitmap);
	flipPage();
	drawBackgroundImage4(l1InstructionsImageBitmap);

	while(state == L1INSTRUCTIONS) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = LEVELONE;
		}
	}

	// REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
}