#include "myLib.h"

//CAREER FAIR 
//Created by Joanna Parkhurst
//CS 2261, Fall 2015

//Description: 
////Career Fair day is here! 
//
////Level One - Get to the CRC and avoid all bikers and people handing out fliers
////If hit by three enemies, you won't make it!
////Cheat: Hit the L button to fly by everyone on a skateboard!
//
////Level Two - Now that you're to the CRC, time to find three friendly recruiters
////Bump into three friendly recruiters to distribute your resumes
////If you bump into three friendly recruiters OR the time runs out, you're forever unemployed!
////Cheat: Find Bill in order to stop the clock!

//Known Bug: On level one, when the enemies reach the left hand side of the screen, 
// it takes a couple seconds for them to disappear.

//Possible Extra Credit: I believe my code is organized very well (see main method) and 
// I used both a simultaneous tiled background (level one) and an extra large background (level two).

//Thanks!

int state = SPLASH;
int prevState;

int main() {
	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;
		switch(state) {
			case SPLASH:
				splash();
				break;
			case L1INSTRUCTIONS:
				l1Instructions();
				break;
			case LEVELONE:
				levelOne();
				break;
			case PAUSE:
				pause();
				break;
			case L1WIN:
				l1Win();
				break;
			case L1LOSE:
				l1Lose();
				break;
			case L2INSTRUCTIONS:
				l2Instructions();
				break;
			case LEVELTWO:
				levelTwo();
				break;
			case L2WIN:
				l2Win();
				break;
			case L2LOSE: //Cheat win
				l2Lose();
				break;
		}
		waitForVblank();
    	flipPage();
	}
	return 0;
}