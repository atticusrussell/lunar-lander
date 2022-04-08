%Atticus Russell
%2/14/2019
%Studio 5
%eliptical comet
clear
clc

%empty arrays
x=zeros(731,1);
y=zeros(731,1);
t=0;
tmax=731;
nmax=731;
dt=tmax/(nmax-1);
phimax=4*pi;
%set day as zero
 for n=1:731
     t(n)=(n-1)*dt;
     r(n)=10000*10/((3-2*cos(2*pi*n/365)));
     phi(n)=(phimax/tmax)*t(n);
     x(n)=r(n)*cos(phi(n));
     y(n)=r(n)*sin(phi(n));
 end

 fprintf('     r           n      phi       x           y \n')
for n=1:731
    fprintf(' %7.3f %7.3f %7.3f   %9.3f    %9.3f\n', r(n), n,phi(n), x(n), y(n))
end
figure(1)
comet(x,y)
hold on
title('Comet Orbital Trajectory')
xlabel('X position[km]')
ylabel('Y position[km]')
hold off
figure(2)
plot(t,x)
hold on
plot(t,y)
title('Orbital Coordinates vs Time')
xlabel('Time [days]')
ylabel('Coordinate[km]')
legend('x coordinate', 'y coordinate')
hold off