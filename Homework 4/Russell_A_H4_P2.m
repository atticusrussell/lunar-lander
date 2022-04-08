%Atticus Russell
%2/12/2019
%MECE 117
%Homework 4
%Problem 2
clear
clc
%Create array a 
a=[2,4,8;1,5,9;3,-2,6];
b=[3,4,5;1,2,4;-6,-8,7];
ab=NaN(3,3);
for n=1:3
    for m=1:3
        ab(n,m)=a(m,n).*b(n,m);
    end
end

ab