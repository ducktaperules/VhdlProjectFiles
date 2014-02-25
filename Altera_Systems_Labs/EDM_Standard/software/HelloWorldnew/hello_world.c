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
#include <stdlib.h>
#include <unistd.h> // usleep()
#include "pwm.h"
#include "utilities.h"

int main() {
	printf("lololol lolol\n");
	//Initilise_PWM('G');
	Initilise_PWM('W');
	//Initilise_PWM('E');
	//Initilise_PWM('S');
	//Initilise_PWM('B');
	printf("initialise\n");
	int interpolations = 100;
	int X = 0;
	int i;

	while (1) {
		for (i = 0; i < interpolations; i++) {
			X = smoothstep(-45, 45, interpolations, i);
			printf("%d,%d \n", i, X);
			Set_Servo_Position('W', X);
			usleep(10000);
		}
		usleep(200000);
//		for (i = 0; i < interpolations; i++) {
//			X = smoothstep(-45, 45, interpolations, i);
//			printf("%d,%d \n", i, X);
//			Set_Servo_Position('W', X);
//			usleep(10000);
//		}
////		usleep(200000);

	}

	return 0;
}

//if((pwm2 == -45) || (pwm2 == 45))
//	  		{
//	  			dir2 = !dir2;
//	  		}
//
//	  if(dir2 == 1)
//	  	  {
//	  		  pwm2++;
//	  	  }
//	  else if(dir2 == 0)
//	  	  {
//	  		  pwm2--;
//	  	  }
//	  //write to the pwm modules
//	  Set_Servo_Position('G', 150);
//	  Set_Servo_Position('W', pwm2);
//	  Set_Servo_Position('E', pwm2);
//	  Set_Servo_Position('S', pwm2);
//	  pwm = Set_Servo_Position('B', pwm2);
//	  usleep(50000);
//	  printf("seting to %d ", pwm2);
//	  printf("mapped to %d \n", pwm);
