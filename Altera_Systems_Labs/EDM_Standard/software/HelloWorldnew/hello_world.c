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
#include "pwm.h"

int main()
{
	printf("lololol lolol\n");
  Initilise_PWM('G');
  Initilise_PWM('W');
  Initilise_PWM('E');
  Initilise_PWM('S');
  Initilise_PWM('B');
  printf("initialised\n");
  int pwm = 75;
  int dir = 1;

  while(1)
  {
	  if((pwm == 100) || (pwm == 50))
		{
			dir = !dir;
		}

	  if(dir == 1)
	  {
		  pwm++;
	  }
	  else if(dir == 0)
	  {
		  pwm--;
	  }
	  //write to the pwm modules
	  Set_Servo_Position('G', 75);
	  Set_Servo_Position('W', pwm);
	  Set_Servo_Position('E', pwm);
	  Set_Servo_Position('S', pwm);
	  Set_Servo_Position('B', pwm);
	  usleep(50000);
	  printf("set to %d\n", pwm);
  }

  return 0;
}
