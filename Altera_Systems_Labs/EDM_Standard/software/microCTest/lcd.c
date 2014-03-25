/*****************************************************************************
 *  File Name  : lcd.c                                                       *
 *  Author     : Sam Hughes                                                  *
 *  Date       : 18/02/2014                                                  *
 *  Requires   : "system.h" - hardware componant addresses and defines       *
 *	   	 	     "altera_avalon_lcd_16207_regs.h" - lcd command/control      *
 *                                                  defines                  *
 *               "lcd.h" - header file for lcd functions in this file        *
 *  Description : This file contains the functions that control the          *
 *                QC1602A LCD module that is connected to the DE0.           *
 *                                                                           *
 * CHANGELOG                                                                 *
 *                                                                           *
 * Version : 1.0     Date : 04/03/2014                                       *
 * Code released as version 1.0 following code review on 04/03/2014.         *
 * For a full list of the changes made see minutes of the code review        *
 * meeting.                                                                  *
 *                                                                           *
 *****************************************************************************/

#include "system.h"
#include "altera_avalon_lcd_16207_regs.h"
#include "lcd.h"

/*****************************************************************************
 *                                                                           *
 * Function    : Initilise_Lcd                                               *
 * Author      : Sam Hughes                                                  *
 * Date        : 19/02/2014                                                  *
 * Inputs      : N/A                                                         *
 * Outputs     : N/A                                                         *
 * Description : This function initilises the LCD module to run with an      *
 *               8 bit parallel interface to have an invisible cursor        *
 *               and to run in two line mode.                                *
 *                                                                           *
 * NOTES       : The usleep values are excessive but erring on the side      *
 *   		     of caution. This will not impact on the reactions of        *
 *			     the arm as the system is relatively simple. If we expand    *
 *		         the system in the future this will need to be revisited     *
 *			     and the timing refined to keep the system response          *
 *			     real-time.                                                  *
 *                                                                           *
 *****************************************************************************/
void Initilise_Lcd()
{
	usleep(25000);

	/* set lcd to use 2 line mode 8 bit interface and 5x8 char size */
	IOWR_ALTERA_AVALON_LCD_16207_COMMAND(LCD_BASE, SMALL_CHAR_8_BIT_2_LINE);
	usleep(5000);

	/* controls the cursor (no blinking, invisible cursor) */
	IOWR_ALTERA_AVALON_LCD_16207_COMMAND(LCD_BASE, NO_CURSE_NO_BLINK);
	usleep(5000);

}
/*****************************************************************************
 *                                                                           *
 * Function     : Clear_Lcd                                                  *
 * Author       : Sam Hughes                                                 *
 * Date         : 18/02/2014                                                 *
 * Inputs       : N/A                                                        *
 * Outputs      : N/A                                                        *
 * Description  : This function clears the screen of the LCD module and      *
 *                returns the cursor to the top left character position      *                                 *
 *                                                                           *
 *****************************************************************************/
void Clear_Lcd()
{
	/* macro that sends the command to the lcd controller                    *
	 * to clear the screen                                                   */
	IOWR_ALTERA_AVALON_LCD_16207_COMMAND(LCD_BASE, CLEAR);
	/*allow the lines to settle before anything else happens*/
	OSTimeDlyHMSM(0, 0, 0, 5);;
}

/*****************************************************************************
 *                                                                           *
 * Function    : Write_To_Lcd                                                *
 * Author      : Queron Williams											 *
 * Date        : 18/02/2014                                                  *
 * Inputs      : lcd_Input is the pointer to the first character in a        *
 *               string to be printed                                        *
 * Outputs     : N/A                                                         *
 * Description : Takes a pointer to the start of a string or character       *
 *               array. Each character is successively written to the		 *
 *				 display, /n causes the display to switch to the second line *
 * NOTES       : Any data sent to this function must conclude with a null    *
 *               character '\0'. This is automatic for any string contained  *
 *               within double quotes.                                       *
 *                                                                           *
 *****************************************************************************/
void  Write_To_Lcd(const char* lcd_Input)
{
	/*clear the screen before beginning a write*/
	Clear_Lcd();
	/* count the number of input new lines */
	int number_Of_Newlines = 0;
	/* keep track of the current character we are writing to the screen */
	int character_Counter = 0;
	/*'\0' represents a null character and marks the
	 * end of the input*/
	while(*(lcd_Input + character_Counter) != '\0')
	{
		/* If the current char is newline move onto the second row            *
		 * only react to one newline per function call                        */
		if(*(lcd_Input + character_Counter) == '\n')
		{
			if(number_Of_Newlines == 0)
			{
				/*move cursor to second line */
				IOWR_ALTERA_AVALON_LCD_16207_COMMAND(LCD_BASE, LCD_NEWLINE);
			}
			number_Of_Newlines++;
		}
		else
		{
			IOWR_ALTERA_AVALON_LCD_16207_DATA(LCD_BASE, *(lcd_Input + character_Counter));
			OSTimeDlyHMSM(0, 0, 0, 1);
		}

		character_Counter++;
	}
}
