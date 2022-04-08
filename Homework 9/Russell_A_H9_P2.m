%Atticus Russell
%3/26/2019
%MECE-117
%Homework 9 Problem 2

clc
clear 

% A. Find currents given voltages and resistances


%have the user input V and the 5 resistance values
v=input('input voltage in V:  ');
r1=input('input the resistance R1 in kilohms:  ');
r2=input('input the resistance R2 in kilohms:  ');
r3=input('input the resistance R3 in kilohms:  ');
r4=input('input the resistance R4 in kilohms:  ');
r5=input('input the resistance R5 in kilohms:  ');

%solve with a system of equations

%input the equations 
syms i1 i2 i3 i4 i5 i6
eqn1 = v - r2*i2 - r4*i4 == 0;
eqn2 = -r2*i2 + r1*i1 + r3*i3 == 0;
eqn3 = -r4*i4 - r3*i3 + r5*i5 == 0;
eqn4 = i6 == i1 + i2;
eqn5 = i4 == i2 + i3;
eqn6 = i1 == i3 + i5;
eqn7 = i6 == i4 + i5;

% make it solve
sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6, eqn7], [i1, i2, i3, i4, i5, i6]);
%define output variables
i1sol= sol.i1;
i2sol= sol.i2;
i3sol= sol.i3;
i4sol= sol.i4;
i5sol= sol.i5;
i6sol= sol.i6;

fprintf('i1 = %d amps \n',i1sol)
fprintf('i2 = %d amps \n',i2sol)
fprintf('i3 = %d amps \n',i3sol)
fprintf('i4 = %d amps \n',i4sol)
fprintf('i5 = %d amps \n',i5sol)
fprintf('i6 = %d amps \n',i6sol)






