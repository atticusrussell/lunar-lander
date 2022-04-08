%Atticus Russell
%2/21/2019
%Studio week 6
%Problem 1

%Trying to calculate Stress & Strain column vectors from Load & Gage 
%Length column vector

%stress is x axis
%strain is y axis'
%fprintf with file id


%clear variables 
clear
%clear command window
clc

%load variables
load('rawtensiledata.mat')

%define the cross setional area (square inches)
A0=0.0313;
%define the initial gauge length (inches)
L0=2.000;

%Shorten reference to GageLen
L=GageLen;
%Shorten reference to Load
F=Load;
%initialize counter
n=1;

%define max of counter
nmax=708;

%create stress vector
stress=zeros(1,708);

%create strain vector
strain=zeros(1,708);


%for loop 
for n=1:nmax
    %calculate stress, in inch pounds, as a function of the counter n
    stress(n)=F(n)/A0;
    %calculate strain, in percent, as a function of the counter n
    strain(n)=((L(n)-L0)/L0);
    %increment the counter 
    n=n+1;
end



%open a new file with handle "result" with the output of stress and strain values
result=fopen('StressandStrain.csv','wt');
for n=1:nmax
    fprintf(result,'%5.1f  %4.2f\n',stress(n),strain(n));
end
%close "result"
fclose(result)

hold on
plot(strain,stress,'+')
xlabel('Strain(%)')
ylabel('Stress(in/lb)')
title('Stress-Strain Curve')
grid on

