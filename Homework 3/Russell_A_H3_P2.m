%Atticus Russell
%2/5/2019
%MECE 117 
%Homework 3
%problem 2

clear
clc

%Prompt user to input the year
prompt="what is the year? ";
year=input(prompt);

%run input through statements to determine if input is a leap year in the
%gregorian calendar

if 0==mod(year,400)
        extra_day=1
elseif 0==mod(year,100) & ~ 0==mod(year,4)
    extra_day=0
elseif 0==mod(year,4) & ~ 0==mod(year,100)
    extra_day=1
else
    extra_day=0 
end


    