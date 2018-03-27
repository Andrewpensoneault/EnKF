This is an implementation of the EnKF to the model described in "An Asynchronous Solver for Systems of ODEs Linked by a Directed Tree Structure" from Scott Small et al.

README.md               - The README file

AssimilationTest.m      - The script driver file for the EnKF 
			         analysis

Datagen.m               - The function which updates the next true 					   value and generates the next (noiseless) data

dydt.m                  - The function for the RHS of the ODE system            				   described in the paper by Scott Small et al.

EnKF.m                  - The function which performs the EnKF

SREnKF.m                - The function which performs the SREnKF


EnKFScriptParameters.m  - The script which contains parameters associated 				   with the data assimilation

linkstructure.m         - The script which contains a connectivity matrix 				   for the tree stucture (and link size)

Modelupdate.m           - The function which updates the particles 					   using the ODE system

paramstoy.m             - The script which loads parameters for the model

PlotCreate.m            - The script which generates 5 plots, the top 				   being Streamflow and the bottom ponded height

