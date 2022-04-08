%Atticus Russell
%3/21/19
%MECE 117
%Studio 9 Problem 2
clear
clc

%input know values  

%set area of the wall (m^2)
area=10;

%set thermal resistances R=D/k (degrees C/Watts)
R1=0.36;
R2=40.1;
R3=4.08;
R4=0.38;

%set inside and outside temperatures (degrees C)
Ti=20;
To=-10;

%define A
A=[1,1/R1,0,0;1,-1/R2,1/R2,0;1,0,-1/R3,1/R3;1,0,0,-1/R4]

%define b
b=[Ti/R1;0;0;To/R4]

%stuff from problem one
% Try Matrix Inversion
%x=Ainv*b
%check to see if A can be inverted 
if det(A)==0
    %Matrix is singular - can't be inverted
    disp('ERROR - Singular matrix A cannot be inverted')
else
    %find solution
    Ainv=inv(A)
    disp('Solution is:')
    x=Ainv*b
end

%Try left-division (Gause-Jordan elimination)
%Create augmented matrix Ab
Ab=[A,b]
%calculate rank and the # of unknows
%rank is fancy speak for the number of independent equations
rA=rank(A)
rAb=rank(Ab)
[eqnA,unkA]=size(A)
%Check for solvability
if rA==rAb
    %sytem can be solved
    if  rA==unkA
        %Solution is unique
        disp('Unique solution exists:')
        x=A\b
    else
        %solution is not unique
        disp('Solution is not unique.')
        %calculate reduced row echelon colution
        disp('Solution set defined by Cx=d.')
        Cd=rref(Ab)
    end
else
    %no solution
    disp('ERROR - System cannot be solved.') 
end