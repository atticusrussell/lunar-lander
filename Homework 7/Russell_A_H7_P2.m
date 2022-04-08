%Atticus Russell
%2/25/19
%MECE 117
%Homework 7 Problem 2

%ciear variables
clear

%clear command window
clc

%original statements
theta=linspace(0,(2*pi),101);
r=exp(.2*theta);
%redefining the functions as a and b
a=spiral(r,theta);
b=spiral2(r,theta);

plot(a,b)
%function 1
function [a] = spiral(r,theta)
    a=r.*cos(theta);
end
%function 2 
function [b] = spiral2(r,theta)
    b=r.*sin(theta);
end


