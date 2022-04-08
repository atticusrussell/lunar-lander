% Debugging practice
% Calculate distance between two points
clc
clear
% Get user input
disp('Enter coords of point 1:')
x1 = input('x1 = ');
y1 = input('y1 = ');
disp('Enter coords of point 2:')
x2 = input('x2 = ');
y2 = input('y2 = ');

% Calculate distance
s = sqrt((x2-x1)^2+(-y2-y1)^2);

% Output answer
disp('The distance between pt 1 & pt 2 is:')
disp(s)



