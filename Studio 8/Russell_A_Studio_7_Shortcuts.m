%Atticus Russell
%2/28/19
%MECE 117
%Studio 7 

%ciear variables
clear

%clear command window
clc

%User input target distance
Td=input('Input the target distance ');
r=5;

while abs(r)>= 2
%User input inital velocity
v0=input('Input the inital velocity ');
%user input angle
theta=input('Input the angle of launch in degrees ');

%set initial x as zero
%x=0;
%set initial y as zero
%y=0;
%define gravity
g=9.81;

%set number of increments
ninc=500;
%max n
nmax=ninc+1;

%blank vector for t
t=zeros(nmax,1);
%set initial t as zero
tmin=0;
%max value for 
tmax=(2*v0*sind(theta))/g;
%t increments
tinc=((tmax-tmin)/ninc);


n=1:nmax;
    t(n)=(n-1)*tinc;
    x(n)=v0*cosd(theta)*t(n);
    y(n)=v0*sind(theta)*t(n)-(0.5*g*(t(n)).^2);

r=x(n)-Td;
hold on
comet(x,y)
plot(Td,0,'*')
ylabel('Height')
xlabel('Horizontal Distance')
%axis([0 Td+Td/4 0 100])
end
disp('you win')