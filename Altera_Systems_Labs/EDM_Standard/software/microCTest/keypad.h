
#ifndef __KEYPAD_H__
#define __KEYPAD_H__

void checkKeypad();

void Initilise_Keypad();

// keypad global varables //
int button[17];

// macros enabling button referencing by name //
#define PRESSED 0
#define M1 1
#define M2 2
#define M3 3
#define DELETE 4
#define UPLEFT 5
#define UP 6
#define UPRIGHT 7
#define PLAY 8
#define LEFT 9
#define STOP 10
#define RIGHT 11
#define RECORD 12
#define DOWNLEFT 13
#define DOWN 14
#define DOWNRIGHT 15
#define SHIFT 16


#endif
