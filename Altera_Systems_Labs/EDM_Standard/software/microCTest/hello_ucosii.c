/*************************************************************************
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
* All rights reserved. All use of this software and documentation is     *
* subject to the License Agreement located at the end of this file below.*
**************************************************************************
* Description:                                                           *
* The following is a simple hello world program running MicroC/OS-II.The * 
* purpose of the design is to be a very simple application that just     *
* demonstrates MicroC/OS-II running on NIOS II.The design doesn't account*
* for issues such as checking system call return codes. etc.             *
*                                                                        *
* Requirements:                                                          *
*   -Supported Example Hardware Platforms                                *
*     Standard                                                           *
*     Full Featured                                                      *
*     Low Cost                                                           *
*   -Supported Development Boards                                        *
*     Nios II Development Board, Stratix II Edition                      *
*     Nios Development Board, Stratix Professional Edition               *
*     Nios Development Board, Stratix Edition                            *
*     Nios Development Board, Cyclone Edition                            *
*   -System Library Settings                                             *
*     RTOS Type - MicroC/OS-II                                           *
*     Periodic System Timer                                              *
*   -Know Issues                                                         *
*     If this design is run on the ISS, terminal output will take several*
*     minutes per iteration.                                             *
**************************************************************************/


#include <stdio.h>
#include "includes.h"
#include <stdlib.h>
#include <unistd.h> // usleep()
#include "pwm.h"
#include "utilities.h"
#include "IK.h"

/* Definition of Task Stacks */
#define   TASK_STACKSIZE       2048
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    task2_stk[TASK_STACKSIZE];

/* Definition of Task Priorities */

#define TASK1_PRIORITY      2
#define TASK2_PRIORITY      1

/* Definition of  que size */

#define queueSize 32

float solution2[3];
/* Prints "Hello World" and sleeps for three seconds */
void task1(void* pdata)
{
	initilisePwm('W');
	initilisePwm('E');
	initilisePwm('S');
	initilisePwm('s');
	initilisePwm('B');
	////printf("initialise\n");
	int IKMode = 1; //to enable IK mode
	float lengths[5]; //in cm
				lengths[0] = 0;
				lengths[1] = 40;
				lengths[2] = 120;
				lengths[3] = 120;
				lengths[4] = 120;
	float target[4]; //in cm
	int noOfPositions = 14;
	int positions3d[14][6] = {{ 0,150,150,0,0, 10 },	//x,y,x,phi,gripper,time
							{ 0,250,150,0,0, 10 },
							{ 0,100,150,0,0, 10 },
							{ 150,100,150,0,0, 10 },
							{ -150,100,150,0,0, 10 },
							{ 0,100,150,0,0, 10 },
							{ 0,200,150,0,0, 10 },
							{ 0,200,250,0,0, 10 },
							{ 0,200,50,0,0, 10 },
							{ 0,200,150,0,0, 10 },
							{ 0,200,150,45,0, 10 },
							{ 0,200,150,-45,0, 100 },
							{ 0,200,150,0,0, 10 },
							{ 0,150,150,0,0, 10 }};
	int interpolations = 1000;
	int X = 0;
	int i,j;
	int oldPosition = 0;
	int newPosition = 0;
	int oldPosition3d[6]= { 0,100,200,0,0, 10 };
	int newPosition3d[6]= { 0,100,200,0,0, 10 };
	int move = 0;

	while (1) {
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
//
//				setServoPosition('B', solution[0]);
//				setServoPosition('S', solution[1]);
//				setServoPosition('E', solution[2]);
//				setServoPosition('W', solution[3]);
			    OSTimeDlyHMSM(0, 0, 0, 100);
			}
			move=move+1;
			if(move>=noOfPositions){move=0;}
			printf("here %d \n",move);
		}
	}
}
/* Prints "Hello World" and sleeps for three seconds */
void task2(void* pdata)
{
  while (1)
  { 
	extern float solution2[3];
	static int count = 0;
	int number = 100;
	int i;

	if (count >= number){count = 0;}

	static float filter[4][100];

	float output[3] = {0,0,0,0};

	filter[0][count]=solution2[0];
	filter[1][count]=solution2[1];
	filter[2][count]=solution2[2];
	filter[3][count]=solution2[3];

	for (i = 0; i < number; i++){output[0] += filter[0][i];}
	output[0] = output[0] / number;
	for (i = 0; i < number; i++){output[1] += filter[1][i];}
	output[1] = output[1] / number;
	for (i = 0; i < number; i++){output[2] += filter[2][i];}
	output[2] = output[2] / number;
	for (i = 0; i < number; i++){output[3] += filter[3][i];}
	output[3] = output[3] / number;

	setServoPosition('B', output[0]);
	setServoPosition('S', output[1]);
	setServoPosition('E', output[2]);
	setServoPosition('W', output[3]);
	//printf(" %f    %f\n",solution2[1],output[1]);
	count++;
    OSTimeDlyHMSM(0, 0, 0, 10);
  }
}
/* The main function creates two task and starts multi-tasking */
int main(void)
{
  
  OSTaskCreateExt(task1,
                  NULL,
                  (void *)&task1_stk[TASK_STACKSIZE-1],
                  TASK1_PRIORITY,
                  TASK1_PRIORITY,
                  task1_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);


  OSTaskCreateExt(task2,
                  NULL,
                  (void *)&task2_stk[TASK_STACKSIZE-1],
                  TASK2_PRIORITY,
                  TASK2_PRIORITY,
                  task2_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
  OSStart();
  return 0;
}

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
