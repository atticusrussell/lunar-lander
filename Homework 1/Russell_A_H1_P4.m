% Atticus Russell
% 1/18/2019
% MECE 117
% Homework 1 Question 4


%noting that am not actually utilizing angles A1 and A2 to calculate but the
%question asked to use them so I have them in the code still but as comments

clear
clc

% prompt user to input variables

%b1 prompt
prompt="what is the length in meters of side b1?";
%b1 input
b1=input(prompt)
%b2 prompt
prompt="what is the length in meters of side b2?";
%b2 input
b2=input(prompt)
%c1 prompt
prompt="what is the length in meters of side c1?";
%c1 input
c1=input(prompt)
%A1 prompt
%prompt="how many degrees is angle A1?";
%A1 input
%A1=input(prompt)
%A2 prompt
%prompt="how many degrees is angle A2?";
%A2 input
%A2=input(prompt)

%formulas

%finding a with the pythagorean theorem
a=sqrt(b1^2+c1^2);

%finding c2 using the pythagorean theorem
c2=sqrt(a^2-b2^2);
%displaying c2
fprintf('The length of line c2 is : %f meters.\n', c2)



