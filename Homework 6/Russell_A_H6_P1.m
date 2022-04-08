%Atticus Russell
%2/25/19
%MECE 117
%Homework 6 Problem 1 

%ciear variables
clear

%clear command window
clc


%% Part A
fprintf('Part A \n')
%define y as the natural logarithm of two
y=log(2);

%display y in fixed-precision format to 6 decimal places
fprintf('y=%.6f \n\n',y) 
    
%% Part B 
fprintf('Part B \n')
%set r equal to e^-7.2
r=exp(-7.2);

%display r in scientific notation to 7 decimal places
fprintf('r=%.4E \n\n',r);

%% Part C
fprintf('Part C \n')
%define a
a=3;
%define b
b=7;
%define phi
phi=7*pi/16;

%calculate x
x=a*cot(phi);
%calculate y
y=b*sin(phi)*cos(phi);

%display coordinates
fprintf('the coordinates of the point are (%.3f,%.3f)\n\n',x,y);

%% Part D
fprintf('Part D \n')
%create array with the angles 
a=[0,30,60,90,120,150];

%calculate and print in tabulated form
fprintf('angle    sin       cos      tan\n')
fprintf('%.0f       %.4f    %.4f   %.4f\n',a(1),sind(a(1)),cosd(a(1)),tand(a(1)))
fprintf('%.0f      %.4f    %.4f   %.4f\n',a(2),sind(a(2)),cosd(a(2)),tand(a(2)))
fprintf('%.0f      %.4f    %.4f   %.4f\n',a(3),sind(a(3)),cosd(a(3)),tand(a(3)))
fprintf('%.0f      %.4f    %.4f   %.4f\n',a(4),sind(a(4)),cosd(a(4)),tand(a(4)))
fprintf('%.0f     %.4f   %.4f  %.4f\n',a(5),sind(a(5)),cosd(a(5)),tand(a(5)))
fprintf('%.0f     %.4f   %.4f  %.4f\n\n',a(6),sind(a(6)),cosd(a(6)),tand(a(6)))

%% Part E
fprintf('Part E \n')
fprintf('%.5f   %.5f   %.5f   %.5f\n',sqrt(3),sqrt(5),sqrt(7),sqrt(11))
fprintf('%.5f   %.5f   %.5f   %.5f\n',log(3),log(5),log(7),log(11))
fprintf('%.5f   %.5f   %.5f   %.5f\n',log10(3),log10(5),log10(7),log10(11))

