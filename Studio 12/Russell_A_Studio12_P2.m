%Atticus Russell
%4/11/2019
%Studio 12
%problem 2

%initialize symbolic variables
syms v i t
c=1e-7;

%create symbolic function for integrand current
i(t)=0.1*exp(-0.5*t)*cos(5*pi*t);

%symbolically integrate i(t) and divide by current to get voltage
V(t)=int(i)/c;

%plot V(t) from t=0 to t=7s
fplot(V,[0,7])
title('Capacitor Voltage');
xlabel('Time [s]')
ylabel('Voltage [V]')
grid on