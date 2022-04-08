%Atticus Russell
%1/29/2019
% MECE 117
% Homework 2 Question 3

clear
clc

%Prompt user to input radius, r
prompt="what is radius r? ";
r=input(prompt);

%Prompt user to input height, h
prompt="what is height h? ";
h=input(prompt);

%calculate area of circle, a
a=pi*r^2;

%area of half the circle
a2=a/2;

%length of top side b of the triangle 
b=sqrt(r^2-h^2);

%area of the both triangles 3
at=b*h;

%angle of the triangle
angt=acosd(h/r);

%angle of the sector
angsec=(180-2*angt)/2;

%area of the sectors
asec=2*((angsec)/360)*pi*r^2;

%aseg
aseg=a2-(at+asec);

%display the area of the sector
fprintf('The area of the sector is : %f in^2.\n', aseg)

