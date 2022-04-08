%Atticus Russell
%4/9/2019
%MECE 117 Homework 11
%Problem 3

clear
clc

%make matrix of x values
x=[1,2,3,4,5,6,7,8,9,10];
%make matrix of y values
y=[2,5,7,9,12,15,18,22,20,17];
%make n equal to the length of x
n=length(x);

%get dy/dx using backwards method
dback=diff(y)./diff(x);

%do element by element division
% create a 4x1 plot in first row
sp(1)=subplot(4,1,1);
plot(x,y,x,y,'o');
ylabel(sp(1),'y');
xlabel(sp(1),'x');
title(sp(1),'Original (x,y) Data');

%plot dback function in the second row
sp(2)=subplot(4,1,2);
%plot from the second value to the last value
plot(x(2:n),dback,x(2:n),dback,'o');
title(sp(2),'Backward Difference Method');
ylabel(sp(2),'dy/dx');
xlabel(sp(2),'x');

%central difference
dcent=(y(3:n)-y(1:n-2))./(x(3:n)-x(1:n-2));
%plot the graph in the third row
sp(3)=subplot(4,1,3);
%plot from the second value to the second to last value
plot(x(2:n-1),dcent,x(2:n-1),dcent,'o');
title(sp(3),'Central Difference Method');
ylabel(sp(3),'dy/dx');
xlabel(sp(3),'x');

%forward differencing method
%create a 4x1 plot in the fourth row
sp(4)=subplot(4,1,4);
%plot from the 1st to 2nd to last values
plot(x(1:n-1),dback,x(1:n-1),dback,'o');
title(sp(4),'Forwards Difference Method');
ylabel(sp(4),'dy/dx');
xlabel(sp(4),'x');
