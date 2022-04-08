%Atticus Russell
%4/9/2019
%MECE 117 Homework 11
%Problem 1

clear
clc

%velocity and time and x position matrix (last row zeros)

time=[0,1,2,3,4,5,6,7,8,9,10];
velocity=[0,2,5,7,9,12,15,18,22,20,17];

%integrate with trapezoid method

dt=time(2)-time(1);
n=length(time);

%trapezoidal
sum=0;

for i=2:n-1
    sum=sum+2*velocity(i);
end

totsum=dt/2*(velocity(1)+sum+velocity(n)+3);

fprintf('the displacement in the x direction is %f \n',totsum);

%disregard this stuff it didnt work
%function[integral]=trapezoid(n)

%t = linspace(0,pi,n);
%dt = t(2) - t(1);
%f_t = sin(t);
%trapint = (sum(f_t) - (f_t(1) + f_t(end))/2)*dt;


%integral=(sum(f_t)-(f_t(1)+f_t(end))/2)*dt;
%end





