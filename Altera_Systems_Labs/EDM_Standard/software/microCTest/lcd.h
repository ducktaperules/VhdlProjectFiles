
#ifndef __LCD_H__
#define __LCD_H__

#define CLEAR 					0x01
#define NO_CURSE_NO_BLINK 		0x0C
#define SMALL_CHAR_8_BIT_2_LINE 0x38
#define LCD_NEWLINE				0xC0

void Initilise_Lcd();

void Clear_Lcd();

void  Write_To_Lcd(const char* lcd_Input);

#endif
