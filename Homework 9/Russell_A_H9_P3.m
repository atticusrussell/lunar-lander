%Atticus Russell
%3/26/2019
%MECE-117
%Homework 9 Problem 3

clc
clear 

%define the pressures [lb/ft^2]
pa=4320;
pb=3600;
pc=2880;

%define the resistances [lb-sec/ft^5]
r1=10000;
r2=14000;
r3=14000; %didnt see r3 defined in the question so used the value for r2 again

%convert the given equations into matrices
A=[r1,r1,1;r2,0,-1;0,r3,-1];
b=[pa;-pb;-pc];
c=A\b;

%figure out the flow rates
q2=c(1,1);
q3=c(2,1);
q1=q2+q3;

%find pressure
p1=c(3,1);


%display flow rates 
fprintf('the flow rate q1 is equal to %f cubic feet per minute \n',q1)
fprintf('the flow rate q2 is equal to %f cubic feet per minute \n',q2)
fprintf('the flow rate q3 is equal to %f cubic feet per minute \n',q3)

%display pressure 
fprintf('the pressure p1 is equal to %f pounds per square foot \n',q1)
