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

// length (l) only has 4 values but for compatibility with DH standard they start at index 1
float *IK(float l[5], float phi, float target[3], float solution[4])
{

	float deg2rad = (float) M_PI/180;
	float rad2deg = (float) 180/M_PI;

//	printf("deg2rad: %f\n",deg2rad); //this print is needed to make the code work. no idea why.
	printf("rad2deg: %f\n",rad2deg);

    float t1 = (float) atan2(target[1],target[0])*rad2deg; // theta 1
    float z = (float) target[2]-(l[4]*sin(phi*deg2rad))-l[1];
    float xyHyp = (float) sqrt(pow(target[0],2)+pow(target[1],2))-(l[4]*cos(phi*deg2rad));

    float cosT3 = (float) (pow(xyHyp,2)+pow(z,2)-pow(l[2],2)-pow(l[3],2))/(2*l[2]*l[3]);

    float t3a = (float) atan2(+sqrt(1-pow(cosT3,2)),cosT3)*rad2deg; // theta 3
    float t3b = (float) atan2(-sqrt(1-pow(cosT3,2)),cosT3)*rad2deg;

    float cosT2a = (float) ((xyHyp*(l[2]+(l[3]*cos(t3a*deg2rad))))+(z*l[3]*sin(t3a*deg2rad)))/(pow(xyHyp,2)+pow(z,2));
    float cosT2b = (float) ((xyHyp*(l[2]+(l[3]*cos(t3b*deg2rad))))+(z*l[3]*sin(t3b*deg2rad)))/(pow(xyHyp,2)+pow(z,2));

    float t2a = (float) atan2(+sqrt(1-pow(cosT2a,2)),cosT2a)*rad2deg; // theta 2
    float t2b = (float) atan2(+sqrt(1-pow(cosT2b,2)),cosT2b)*rad2deg;

    float t4a = (float) phi-(t2a+t3a)-90; // theta 4
    float t4b = (float) phi-(t2b+t3b)-90;


	printf("t1: %f\n",t1);
	printf("t2: %f\n",t2a);
	printf("t3: %f\n",t3a);
	printf("t4: %f\n",t4a);

    solution[0] = t1;
    solution[1] = t2a;
    solution[2] = t3a;
    solution[3] = t4a;

	return solution;
}

//float target[3]; //in cm
//target[0] = 10;
//target[1] = 10;
//target[2] = 10;
//
////  Expected 1: 1=0.00 2=45.00 3=-45.00 4=-45.00
////  Solution 1: 1=45.00 2=4.38 3=149.47 4=-243.86
////  Solution 2: 1=45.00 2=145.09 3=-149.47 4=-85.62
//
//
//float lengths[5]; //in cm
//lengths[0] = 0;
//lengths[1] = 4;
//lengths[2] = 12.1;
//lengths[3] = 12.1;
//lengths[4] = 12;
//
//float buf[4];
//float *solution = IK(lengths,0,target,buf);
//
//printf("solution t1: %f\n", solution[0]);
//printf("solution t2: %f\n", solution[1]);
//printf("solution t3: %f\n", solution[2]);
//printf("solution t4: %f\n", solution[3]);
