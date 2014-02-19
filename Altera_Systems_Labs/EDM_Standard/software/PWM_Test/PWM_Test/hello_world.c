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
  Initilise_PWM(1);
  Initilise_PWM(2);
  Initilise_PWM(3);
  Initilise_PWM(4);
  Initilise_PWM(5);
  Initilise_PWM(6);

  int pwm = 1;
  int dir = 1;

  while(1)
  {
	  if((pwm == 100) || (pwm == 0))
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
	  Set_PWM_Duty_Cycle(1, 50);
	  Set_PWM_Duty_Cycle(2, 0);
	  Set_PWM_Duty_Cycle(3, pwm);
	  Set_PWM_Duty_Cycle(4, pwm);
	  Set_PWM_Duty_Cycle(5, pwm);
	  Set_PWM_Duty_Cycle(6, pwm);
	  //usleep(10000);
  }

  return 0;
}
