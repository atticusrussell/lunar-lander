%Atticus Russell
%2/5/2019
%MECE 117 
%Homework 3
%problem 1

clear
clc

%Prompt user to input value for a
prompt="In ax^2+bx+c, what is the value of a? ";
a=input(prompt);

%Prompt user to input value for b
prompt="In ax^2+bx+c, what is the value of b? ";
b=input(prompt);


%Prompt user to input value for c
prompt="In ax^2+bx+c, what is the value of c? ";
c=input(prompt);


if b^2-4*a*c <= 0
    disp('your roots are imaginary')
    
end

%calculate first root
root1=-b+sqrt(b^2-4*a*c)/2*a;
%calculate second root
root2=-b-sqrt(b^2-4*a*c)/2*a;

%display first root
fprintf('the first root is %f \n',root1) 
%display second root
fprintf('the second root is %f \n',root2) 



    
    