#include <stdlib.h>
#include "myLib.h"
#include "pauseImage.h"

void pause();

extern int state;
extern int prevState;

void pause() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(pauseImagePal);

	flipPage();
	drawBackgroundImage4(pauseImageBitmap);
	flipPage();
	drawBackgroundImage4(pauseImageBitmap);

	while(state == PAUSE) {
		if(BUTTON_HELD(BUTTON_A) && (prevState == LEVELONE)) {
			state = LEVELONE;
			unpauseSound();
		} else if (BUTTON_HELD(BUTTON_A) && (prevState == LEVELTWO)) {
			state = LEVELTWO;
			unpauseSound();
		}
	}
}