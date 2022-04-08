%Atticus Russell
%1/28/2019
% MECE 117
% Homework 2 Question 2

clear
clc

%initalize variables

%Diameter of piston in mm
Dpist=100;
%Length of connecting rod one in mm
L1=140;
%Length of connecting rod two in mm
L2=50;
%Clearance volume in cm^3 
Vcl=100;
%Initial pressure in kPa
Pinit=100;
%Initial temperature in K
Tinit=400;
%Angle B in degrees
B=0;
%Specific hear ratio
k=1.4;
%height of piston from centerline of crankshaft in mm
d=L1-L2;
%Prompt user to input crank angle CA in degrees
prompt="what is the crank angle CA in degrees? ";
CA=input(prompt);

%Calculate d_btm
d_btm=L1-L2;
%Calculate Apist (while converting Dpist from mm to cm)
Apist=(pi/4)*(Dpist/10)^2;
%Calculate Vmax
Vmax=Apist*(2*L2)+Vcl;

%Initialize variables
%current temperature equals initial temperature
Tcurr=Tinit;
%current pressure equals initial pressure
Pcurr=Pinit;

%Calculate angles A and B in degrees
A=CA-360;
B=asin(L2*sin(A)/L2);


%Calculate d
d=L1*cos(B)+L2*cos(A);

%Calculate V 
V=Vmax-Apist*(d-d_btm);

%Calculate Pcurr
Pcurr=(V^k/Vmax^k)^-1*Pinit;

%Calculate Tcurr
Tcurr=((V^k/Vmax^k)^((1-k)/k))*Tinit;

%display volume of the cylinder
fprintf('The volume of the cylinder is : %f cm^3.\n', V)
%display pressure in the cylinder
fprintf('The pressure in the cylinder is : %f kPa.\n', Pcurr)
%display the temperature in the cylinder
fprintf('The temerature in the cylinder is : %f K.\n', Tcurr)



