/*
 * IK.c
 *
 *  Created on: 25 Feb 2014
 *      Author: Hugo Hall
 */

#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "IK.h"
#include "math.h"
#include "utilities.h"

// length (l) only has 4 values but for compatibility with DH standard they start at index 1
float *IK( float target[5], float solution[5])
{
	float phi = target[3];
	float deg2rad = (float) M_PI/180;
	float rad2deg = (float) 180/M_PI;

//	printf("deg2rad: %f\n",deg2rad); //this print is needed to make the code work. no idea why.
//	printf("rad2deg: %f\n",rad2deg);

    float t1 = (float) atan2(target[1],target[0])*rad2deg; // theta 1
    float z = (float) target[2]-(L4*sin(phi*deg2rad))-L1;
    float xyHyp = (float) sqrt(pow(target[0],2)+pow(target[1],2))-(L4*cos(phi*deg2rad));

    float cosT3 = (float) (pow(xyHyp,2)+pow(z,2)-pow(L2,2)-pow(L3,2))/(2*L2*L3);

    float t3a = (float) atan2(+sqrt(1-pow(cosT3,2)),cosT3)*rad2deg; // theta 3
    float t3b = (float) atan2(-sqrt(1-pow(cosT3,2)),cosT3)*rad2deg;

    float cosT2a = (float) ((xyHyp*(L2+(L3*cos(t3a*deg2rad))))+(z*L3*sin(t3a*deg2rad)))/(pow(xyHyp,2)+pow(z,2));
    float cosT2b = (float) ((xyHyp*(L2+(L3*cos(t3b*deg2rad))))+(z*L3*sin(t3b*deg2rad)))/(pow(xyHyp,2)+pow(z,2));

    float t2a = (float) atan2(+sqrt(1-pow(cosT2a,2)),cosT2a)*rad2deg; // theta 2
    float t2b = (float) atan2(+sqrt(1-pow(cosT2b,2)),cosT2b)*rad2deg;

    float t4a = (float) phi-(t2a+t3a)-90; // theta 4
    float t4b = (float) phi-(t2b+t3b)-90;

    solution[0] = t1-90;
    solution[1] = -t2b+90;
    solution[2] = +90+t3b;
    solution[3] = -t4b-90;
    solution[4] = target[4];

    extern float solution2[3];
    solution2[0] = t1-90;
    solution2[1] = -t2b+90;
    solution2[2] = +90+t3b;
    solution2[3] = -t4b-90;
//    printf("t1: %f\n",solutio

	return solution;
}

void moveArm(int positions3d[14][6], int program, int move)
{
	static int interpolations = 1000;
	static int i,j;
	static int oldPosition = 0;
	static int newPosition = 0;
	static float target[5]; //in cm
	static int oldPosition3d[6]= { 0,100,200,0,0, 10 };
	static int newPosition3d[6]= { 0,100,200,0,0, 10 };
	for (i = 0; i < 5; i++)
			{
				oldPosition3d[i] = newPosition3d[i] ;
				newPosition3d[i] = positions3d[move][i];
			}

			interpolations = positions3d[move][5];
			for (i = 0; i < interpolations; i++) {
				for (j = 0; j < 5; j++)
				{
					oldPosition = oldPosition3d[j];
					newPosition = newPosition3d[j];
					target[j] = smoothstep(oldPosition, newPosition, interpolations, i);
				}

				float buf[5];
				float *solution = IK(target,buf);
			    OSTimeDlyHMSM(0, 0, 0, 100);
			}
}
void moveArmDirect(int positions3d[14][6], int program, int move)
{
	static float target[5]; //in cm
	int i;
	for (i = 0; i < 5; i++)
	{
		target[i] = positions3d[move][i];
	}
	float buf[5];
	float *solution = IK(target,buf);
}
