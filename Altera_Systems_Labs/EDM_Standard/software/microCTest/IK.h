/*
 * IK.h
 *
 *  Created on: 25 Feb 2014
 *      Author: hugo__000
 */

#ifndef IK_H_
#define IK_H_

float *IK( float target[4], float solution[4]);

void moveArm(int positions3d[14][6], int program, int move);

void moveArmDirect(int positions3d[14][6], int program, int move);

#define L0 0
#define L1 40
#define L2 120
#define L3 120
#define L4 120

#endif /* IK_H_ */
