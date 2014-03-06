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
#include "IK.h"



int main() {
	//printf("lololol lolol\n");
	initilisePwm('W');
	initilisePwm('E');
	initilisePwm('S');
	initilisePwm('s');
	initilisePwm('B');
	////printf("initialise\n");

	int replay = 0; //to enable replaying mode
	int IKMode = 1; //to enable IK mode
	float lengths[5]; //in cm
				lengths[0] = 0;
				lengths[1] = 40;
				lengths[2] = 120;
				lengths[3] = 120;
				lengths[4] = 120;
	float target[4]; //in cm

	int positions[5][2] = {{ 0, 100 },
						   { 45, 500 },
						   { -45, 400 },
						   { 45, 800 },
						   { -15, 200 }};
	int noOfPositions = 14;
	int positions3d[14][6] = {{ 0,150,150,0,0, 100 },	//x,y,x,phi,gripper,time
							{ 0,250,150,0,0, 100 },
							{ 0,100,150,0,0, 100 },
							{ 150,100,150,0,0, 100 },
							{ -150,100,150,0,0, 100 },
							{ 0,100,150,0,0, 100 },
							{ 0,200,150,0,0, 100 },
							{ 0,200,250,0,0, 100 },
							{ 0,200,50,0,0, 100 },
							{ 0,200,150,0,0, 100 },
							{ 0,200,150,45,0, 100 },
							{ 0,200,150,-45,0, 100 },
							{ 0,200,150,0,0, 100 },
							{ 0,150,150,0,0, 100 }};
	int interpolations = 1000;
	int X = 0;
	int i,j;
	int oldPosition = 0;
	int newPosition = 0;
	int oldPosition3d[6]= { 0,100,200,0,0, 100 };
	int newPosition3d[6]= { 0,100,200,0,0, 100 };
	int move = 0;

	while (1) {

		if(replay==1)
		{
			oldPosition = newPosition;
			newPosition = positions[move][0];
			interpolations = positions[move][2];
			//printf("%d,%d \n", newPosition, interpolations);
			for (i = 0; i < interpolations; i++) {
				X = smoothstep(oldPosition, newPosition, interpolations, i);
				//printf("%d,%d \n", interpolations, X);
				setServoPosition('W', X);
				usleep(1000);
			}
			usleep(1000000);
			move=move+1;
			if(move>=5){move=0;}
		}

		if(IKMode==1)
		{
			for (i = 0; i < 5; i++)
			{
				oldPosition3d[i] = newPosition3d[i] ;
				newPosition3d[i] = positions3d[move][i];
			}
			interpolations = positions3d[move][5];

			for (i = 0; i < interpolations; i++) {
				for (j = 0; j < 4; j++)
				{
					oldPosition = oldPosition3d[j];
					newPosition = newPosition3d[j];
					target[j] = smoothstep(oldPosition, newPosition, interpolations, i);
				}

				float buf[4];
				float *solution = IK(lengths,target[3],target,buf);

				setServoPosition('B', solution[0]);
				setServoPosition('S', solution[1]);
				setServoPosition('E', solution[2]);
				setServoPosition('W', solution[3]);
				usleep(1);
			}
			move=move+1;
			if(move>=noOfPositions){move=0;}
			printf("here %d \n",move);
		}

	}

	return 0;
}
