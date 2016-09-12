#include <stdlib.h>
#include "myLib.h"
#include "l2InstructionsImage.h"

void l2Instructions();

extern int state;

void l2Instructions() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(l2InstructionsImagePal);

	flipPage();
	drawBackgroundImage4(l2InstructionsImageBitmap);
	flipPage();
	drawBackgroundImage4(l2InstructionsImageBitmap);

	while(state == L2INSTRUCTIONS) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = LEVELTWO;
		}
	}

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
}