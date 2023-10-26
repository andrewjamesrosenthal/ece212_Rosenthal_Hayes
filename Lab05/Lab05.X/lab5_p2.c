int main(int argc, char** argv) {
    ece212_lafbot_setup();
    int forward = 1;
    while (1) {

        RFORWARD = 0x8000;
        RBACK = 0;
        LFORWARD = 0x8000;
        LBACK = 0;
        delayms(500);
        
        RFORWARD = 0;
        RBACK = 0;
        LFORWARD = 0;
        LBACK = 0;
        delayms(1000);
        
        RBACK = 0x8000;
        RFORWARD = 0;
        LBACK = 0x8000;
        LFORWARD = 0;
        delayms(500);
        
        RFORWARD = 0;
        RBACK = 0;
        LFORWARD = 0;
        LBACK = 0;
        delayms(1000);
    }
    return (EXIT_SUCCESS);
}

