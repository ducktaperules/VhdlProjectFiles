/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "altera_avalon_lcd_16207_regs.h"
#include "altera_avalon_lcd_16207.h"
#include "altera_avalon_pio_regs.h"
#include "HAL/inc/sys/alt_sys_init.h"

int main()
{
	alt_sys_init();
	FILE *lcd_d = 0;
	char matt_Has_No_Penis[100] = "Hello";
	char *ptr = &matt_Has_No_Penis;
	//char* point_To_Start = matt_Has_No_Penis[0];
	int len = 5;
	//lcd_d = fopen("LCD_NAME", "w");
	//printf("adrgfdfsdrfafaeaeraeraeraserserseertaert4tq34tqyHello Steve");
	altera_avalon_lcd_16207_write_fd(lcd_d, ptr, len);

 // printf("Hello from Nios II!\n");

  return 0;
}
