
#ifndef __KEYPAD_H__
#define __KEYPAD_H__

int Check_Keypad();

void checkKeypad();

void Enable_Keypad_Col(int col);

int Read_Keypad_Col(int col);

void Initilise_Keypad();

// keypad global varables //
int button[17];

#define PRESSED 0
#define SHIFT 1
#define M1 2
#define M2 3
#define M3 4
#define UPLEFT 5
#define UP 6
#define UPRIGHT 7
#define MENU 8
#define LEFT 9
#define STOP 10
#define RIGHT 11
#define RECORD 12
#define DOWNLEFT 13
#define DOWN 14
#define DOWNRIGHT 15
#define PLAY 16


#endif
