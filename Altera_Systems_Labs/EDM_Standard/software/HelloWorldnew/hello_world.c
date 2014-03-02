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
	//printf("lololol lolol\n");
	initilisePwm('W');
	////printf("initialise\n");
	int positions[5][2] = {{ 0, 100 },
						   { 45, 500 },
						   { -45, 400 },
						   { 45, 800 },
						   { -15, 200 }};
	int interpolations = 500;
	int X = 0;
	int i;
	int oldPosition = 0;
	int newPosition = 0;
	int move = 0;

	while (1) {
		oldPosition = newPosition;
		newPosition = positions[move][0];
		interpolations = positions[move][1];
		//printf("%d,%d \n", newPosition, interpolations);

		for (i = 0; i < interpolations; i++) {
			X = smoothstep(oldPosition, newPosition, interpolations, i);
			printf("%d,%d \n", interpolations, X);
			setServoPosition('W', X);
			usleep(1000);
		}
		usleep(1000000);

		move=move+1;
		if(move>=5){move=0;}


	}

	return 0;
}
