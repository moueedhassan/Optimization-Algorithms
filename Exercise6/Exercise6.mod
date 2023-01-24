/*********************************************
 * OPL 12.10.0.0 Model
 * Author: H_MOUEED
 * Creation Date: Apr 9, 2022 at 12:19:12 AM
 *********************************************/
int NumberofCities = ...;
int NumberofRegions = ...;

range I = 1..NumberofRegions;
range J = 1..NumberofCities;

int Loss[I][J] = ...; //defining the loss matrix

dvar boolean x[I][J]; //decision variable x
dvar boolean y[J]; //decision variable y


minimize (sum(j in J) 50 * y[j] + sum(i in I, j in J) x[i][j] * Loss[i][j]); //objective function

subject to{
 
  forall(i in I) sum(j in J) x[i][j] == 1; //constraint 1
 
  forall(i in I, j in J) x[i][j] <= y[j]; //constraint 2
  }
  
