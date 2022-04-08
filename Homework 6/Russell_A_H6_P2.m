%Atticus Russell
%2/25/19
%MECE 117
%Homework 6 Problem 2

%ciear variables
clear

%clear command window
clc

%input the data
time=[1,2,3,4,5,6,7,8,10];
rpm=[1210,1866,2301,2564,2724,2881,2879,2915,3010];

ninc=100;
nmax=ninc+1;
tstart=0;
tend=10;
t=zeros(nmax,1);
tinc=(tend-tstart)/ninc;

for n=1:nmax
    t(n)=tstart+(tinc*(n-1));
    a(n)=3000*(1-exp(-.5*t(n)));
   
end
x=1;
hold on
plot(time,rpm,'.','MarkerSize',20)
plot(t,a)
legend('Data set','theoretical')
xlabel('Time(s)')
ylabel('Speed(rpm)')
title('RPM versus time')
grid on
hold off
