/*/* 
 * File:   Lab05_p1.c
 * Author: hayesdl
 *
 * Created on October 19, 2023, 1:46 PM
 */

#include "ece212.h"

int main(int argc, char** argv) {
    ece212_setup();
    int direction = 1;
    int currentPosition = 0b0001;

    while (1) {
        if (BTN11) {
            direction = -direction;
            delayms(200);


            if (direction == 1) {
                currentPosition <<= 1;
                if (currentPosition > 0b1000) {
                    currentPosition = 0b0001;
                }
            } else {
                currentPosition >>= 1;
                if (currentPosition < 0b0001) {
                    currentPosition = 0b1000;
                }
            }
        }

        writeLEDs(currentPosition);
        delayms(200);

        if (direction == 1) {
            currentPosition <<= 1;
            if (currentPosition > 0b1000) {
                currentPosition = 0b0001;
            }
        } else {
            currentPosition >>= 1;
            if (currentPosition < 0b0001) {
                currentPosition = 0b1000;
            }
        }
    }
    return (EXIT_SUCCESS);
}






