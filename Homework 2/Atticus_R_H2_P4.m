%Atticus Russell
%1/29/2019
% MECE 117
% Homework 2 Question 4

clear
clc

%Prompt user to input coefficient, a
prompt="what is the coefficient, a? ";
a=input(prompt);

%Prompt user to input upper bound of integration, b2
prompt="what is the upper bound of integration? ";
b2=input(prompt);

%Prompt user to input lower bound of integration, b1
prompt="what is the lower bound of integration? ";
b1=input(prompt);

%calculate lower bound of integral using 6 terms
dx1_6=log10(b1)+(b1/1)*(log10(a)/1)+(b1^2/2)*((log10(a)^2)/2)+(b1^3/3)*((log10(a))^3/3)+(b1^4/4)*((log10(a))^4/4)+(b1^5/5)*((log10(a))^5/5)+(b1^6/6)*((log10(a))^6/6);

%calculate lower bound of integral using 5 terms
dx1_5=log10(b1)+(b1/1)*(log10(a)/1)+(b1^2/2)*((log10(a)^2)/2)+(b1^3/3)*((log10(a))^3/3)+(b1^4/4)*((log10(a))^4/4)+(b1^5/5)*((log10(a))^5/5);

%calculate upper bound of integral using 6 terms
dx2_6=log10(b2)+(b2/1)*(log10(a)/1)+(b2^2/2)*((log10(a)^2)/2)+(b2^3/3)*((log10(a))^3/3)+(b2^4/4)*((log10(a))^4/4)+(b2^5/5)*((log10(a))^5/5)+(b2^6/6)*((log10(a))^6/6);

%calculate upper bound of integral using 5 terms
dx2_5=log10(b2)+(b2/1)*(log10(a)/1)+(b2^2/2)*((log10(a)^2)/2)+(b2^3/3)*((log10(a))^3/3)+(b2^4/4)*((log10(a))^4/4)+(b2^5/5)*((log10(a))^5/5);

%calculate integral using 6 terms
integral_6=dx2_6-dx1_6;

%calculate integral using 5 terms
integral_5=dx2_5-dx1_5;

%percenr error
Perror=(abs((integral_5-integral_6)/integral_6))*100;

%display the integral using 6 values
fprintf('The integral using 6 values is : %f .\n', integral_6)

%display the integral using 5 values
fprintf('The integral using 5 values is : %f .\n', integral_5) 

%display the percent error
fprintf('The percent error between using 5 and 6 values is : %f percent.\n', Perror)

