%Atticus Russell
%2/5/2019
%MECE 117 
%Studio 3
%FOR loops sum



clear
clc

%sum using for loops following example from studio and filling in
summ = 0;
nloops = 10;
for n = 1:1:nloops
newterm=5*n^3;
summ=summ+newterm;
end
f=summ

