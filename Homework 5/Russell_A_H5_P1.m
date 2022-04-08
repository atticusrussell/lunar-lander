%Atticus Russell
%2/18/2019
%MECE 117
%Homework 5
%Problem 1

clear
clc
%user input V0
V0=input('enter the initial velocity value, V0: ');
%user input drag coefficient
Cd=0.5;%input('enter coefficient of drag: ');
%user input mass
m=5.5;%input('input the mass of the projectile: ');

g=9.81;

dt=0.1;
n=1;

y(1)=0;
V(1)=V0;
t(1)=0;

while y(n)>=0
    Fd=Cd*V(n)^2;
    a=-(g-Fd);
    n=n+1;
    t(n)=t(n-1)+dt;
    V(n)=V0+a*(n-1);
    y(n)=V(n-1)*dt+(0.5*a*((n-1)*dt)^2)
end



