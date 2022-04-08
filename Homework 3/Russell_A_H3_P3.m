%Atticus Russell
%2/5/2019
%MECE 117 
%Homework 3
%problem 3

clear
clc

sum=0;
n=1;
x=1;
while x<= 100000000
    p=(4*(-1)^(n+1))/(2*n-1); %equation for summation
    sum=sum+p;
    n=n+1;
    x=x+100;
end
%display pi
fprintf('pi= %f \n',sum) 


