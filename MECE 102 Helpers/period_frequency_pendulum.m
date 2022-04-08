clc
clear

global g R
g=9.81;

R=input('What is the length, R, of the pendulum arm in meters? ');

w=freq(R,g);
T=period(w);

fprintf('The natural frequency omega is %f radians per second \n',w);
fprintf('the period T is %f seconds \n',T)

%function to solve for natural frequency w with g and R
function[w]= freq(R,g)
w=sqrt(g/R);
end

%function to solve for period T with w
function[T]= period(w)
T=(2*pi)/w;
end