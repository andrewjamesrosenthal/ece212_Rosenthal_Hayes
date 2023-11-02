#include "ece212.h"

int main() {
    ece212_lafbot_setup();
    int sensorL;
    int sensorR;

    while (1) {
        sensorL = analogRead(LEFT_SENSOR);
        sensorR = analogRead(RIGHT_SENSOR);

        //moves straight
        if (sensorL <= 340 && sensorR <= 340) {
            RFORWARD = 65536;
            RBACK = 0;
            LFORWARD = 65536;
            LBACK = 0;
        }
        else if (sensorL > 340) {

            //turn right
            RBACK = 0;
            RFORWARD = 65536;
            LBACK = 0;
            LFORWARD = 0;
            sensorL = analogRead(LEFT_SENSOR);

        }
        else if (sensorR > 340) {

            //turn left 
            RBACK = 0;
            RFORWARD = 0;
            LBACK = 0;
            LFORWARD = 65536;
            sensorR = analogRead(RIGHT_SENSOR);

        }

    }
    return (EXIT_SUCCESS);
}

