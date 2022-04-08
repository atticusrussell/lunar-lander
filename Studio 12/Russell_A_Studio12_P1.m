%Atticus Russell
%4/11/2019
%Studio 12
%problem 1

clc
clear

%initialize symbolic variables
syms a b c A

%create a symbolic expression for law of cosines
LC=a^2==b^2+c^2-2*b*c*cos(A);

%solve equation LC for variable b
b_soln=solve(LC,b);

%evaluate solution for b with values of a, c and A
b_ans=subs(b_soln,[a,c,A],[5,2,deg2rad(60)]);

%convert symbolic answer to numerical answer
b_val=vpa(b_ans,3)

