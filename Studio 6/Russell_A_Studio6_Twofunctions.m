%Atticus Russell
%2/21/2019
%Studio week 6
%Problem 2

%clear variables 
clear
%clear command window
clc

%input variables
a=2;
b=3;

%define fmin
fmin=pi/10;
%define fmax
fmax=9*pi/10;
i=1;
%initialize n
for n=fmin:8*pi/10*0.01:fmax 
    %serpentine curve
    x(i)=a*cot(n);
    y(i)=b*sin(n)*cos(n);
    yw(i)=a*sin(n)^2;
    i=i+1;
end

hold on
plot(x,y,'-pr')
plot(x,yw,'-ob')
xlabel('x = acot(phi)')
ylabel('y = Function value')
legend('Serpent', 'Witch of Agnesi')
grid on
title('Serpentine and Witch of Agnesi Curve')
