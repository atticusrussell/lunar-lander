%Atticus Russell
%1/24/2019
%MECE 117 
%Studio 2
%Additional Exercises - verify tan

clc
clear
% Ge user input for x
x=input('Enter value of x: ');

% Calculate tan 2x
% Definiton of tan 2x
y1=2*(tan(x)/(1-(tan(x)^2)));
% MATLAB tan(2x) function
y2=tan(2*x);
% Percent difference
pcterr = (y1-y2)/y1 *100;

% Output results
disp('The definition of sinh x  gives:')
disp(y1)
disp('The MATLAB function sinh(x) gives:')
disp(y2)
disp('The percent error between the two is:')
disp(pcterr)
