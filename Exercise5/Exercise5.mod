/*********************************************
 * OPL 12.10.0.0 Model
 * Author: H_MOUEED
 * Creation Date: Apr 8, 2022 at 9:54:49 PM
 *********************************************/
int Numberofcities = ...;
range I = 1..Numberofcities;
range J = 1..Numberofcities;

int Cost[I][J] = ...; //defining the cost matrix

dvar boolean x[I][J]; //decision variable 

dvar int+ u[I]; //auxilliary variable for subtour cancellation

minimize sum(i in I, j in J) x[i][j] * Cost[i][j]; //objective function

subject to{
  
  //arrive and depart only once constraints
  forall(i in I) sum(j in J) x[i][j] == 1; 
  forall(j in J) sum(i in I) x[i][j] == 1; 
  
  
  //subtour cancellation constraint using Miller-Tucker-Zemlin formulation 
  forall(i in I, j in J: j != 1) u[i] + x[i][j] <= u[j] + (Numberofcities-1)*(1-x[i][j]);
 
  u[1] == 0;
  }

  //explanation of solution
  //x13 = 1, x25 = 1, x34 = 1, x42 = 1, x52 = 1 
  //the route then becomes 1 --> 3 --> 4 --> 2 --> 5 --> 1 and total distance is 668
  