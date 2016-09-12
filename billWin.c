#include <stdlib.h>
#include "myLib.h"
#include "billWinImage.h"

void billWin();

extern int state;

void billWin() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
	buttons = BUTTONS;

	loadPalette(billWinImagePal);

	flipPage();
	drawBackgroundImage4(billWinImageBitmap);
	flipPage();
	drawBackgroundImage4(billWinImageBitmap);

	while(state == BILLWIN) {
		if(BUTTON_HELD(BUTTON_A)) {
			state = SPLASH;
		}
	}
}