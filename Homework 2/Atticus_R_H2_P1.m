%Atticus Russell
%1/28/2019
% MECE 117
% Homework 2 Question 1

clear
clc
%prompt user to input d
prompt="How many meters is d? ";
%set d as user input
d=input(prompt);
%prompt user to input L
prompt="How many meters is L? ";
%set L as user input
L=input(prompt);
%prompt user to input r
prompt="How many meters is r? ";
%set r as user input
r=input(prompt);
%solve for C
C=(pi*8.854*10^-12*L)/log((d-r)/r), disp("meters")

