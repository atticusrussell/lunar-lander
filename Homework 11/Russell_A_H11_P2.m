%Atticus Russell
%4/9/2019
%MECE 117 Homework 11
%Problem 2

clear
clc

C=10^-7; %[F]
t=1.2;   %[s]
Q0=0;    %[C]

%create function fun to calculate current
fun=@(t) 0.2*(1+ sin(.2)*t);

%integrate function
q=integral(fun,0,t);

%find voltage [v]
v=1/C*q+Q0;

%print results 
fprintf('The voltage is %f [V] \n',v);