% Atticus Russell
% 1/17/2019
% MECE 117
% Homework 1 Question 3

clear
clc

%defining variables

%volume (liters)
V=22.41;
%temperature (kelvin)
T=273.2;
%gas constant
R=0.0826;
%1 mol of gas
n=1;
%chlorine specific values
a=6.49;
b=0.0562;

%formulas 

%ideal gas law
p1=(n*R*T)/V;
%display pressure calculated by ideal gas law
"pressure calculated by ideal gas law"
p1
%van der waals equation
p2=((n*R*T)/(V-(n*b)))-((a*(n^2))/V^2);
%display pressure calculated by van der waals equation
"pressure calculated by van der waals equation"
p2

%difference between equations
dp=p1-p2;
%display difference between equations
"difference in calculated pressures"
dp

"the main cause of the difference in pressure estimates is the molecular attractions"