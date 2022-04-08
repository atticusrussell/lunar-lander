%Atticus Russell
%1/24/2019
%studio 2 complex integral

clear
clc

%telling user what program is doing
disp('to evaluate the integral x*dx/1-sin(a*x)')

% Get user input for a
a=input('Enter value of a: ');

% Get user input for x
x=input('Enter value of x: ');
%solve
answer=(x/a)*cot((pi/4)-(a*x/2))+(2/a^2)*log(abs(sin((pi/4)-(a*x)/2)))


