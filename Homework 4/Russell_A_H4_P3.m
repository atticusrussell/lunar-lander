%Atticus Russell
%2/12/2019
%MECE 117
%Homework 4
%Problem 3

clear
clc

%User input for W, L_b, L_c
W=input('enter value for W:');
L_b=input('enter value for L_b:');
L_c=input('enter value for L_c:');

%create while loop
nn=0.5;

n=5;
while n<30
    n=n+1;
    nn = n*(.1)
    T(n)=(L_b*L_c*W)/(nn*sqrt((L_c^2)-nn^2));
end
nn
T
plot(nn,T)

