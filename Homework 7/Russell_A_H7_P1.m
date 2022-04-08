%Atticus Russell
%2/25/19
%MECE 117
%Homework 7 Problem 1

%ciear variables
clear

%clear command window
clc
%Prompt the user to input the temperature in farenheit
%and set that input as Tf
Tf=input('Temp F = ');
%Prompt the user to input the temperature in celsius
%and set that input as Tc
Tc=input('temp C = ');
%set outputs 
TempC=TempF(Tf);
Tempf=Tempc(Tc);
%display the output
disp(TempC)
disp(Tempf)
%functions to calculate the temperature
function [TempC] = TempF(Tf)
    TempC=(5/9)*(Tf-32);
end
function [Tempf] = Tempc(Tc)
    Tempf=((9/5)*Tc)+32;
end