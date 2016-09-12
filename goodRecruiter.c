#include <stdlib.h>
#include "myLib.h"
#include "goodRecruiterFound.h"

void goodRecruiter();

extern int state;

void goodRecruiter() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(goodRecruiterFoundPal);

	flipPage();
	drawBackgroundImage4(goodRecruiterFoundBitmap);
	flipPage();
	drawBackgroundImage4(goodRecruiterFoundBitmap);

	int counter = 0;
	while(state == GOODRECRUITER) {
		counter++;
		if(counter == 120) {
			state = LEVELTWO;
		}
	}
}