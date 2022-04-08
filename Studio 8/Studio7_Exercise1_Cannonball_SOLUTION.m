% MECE-117 Intro to Programming
% Studio Week 7 - Exercise #1
% Cannonball Game

% Clear workspace
clear
% Close any existing figures
close all
% Clear command window
clc

% Get user input for target distance
x_trgt = input('Enter target distance in meters: ');    % {m}
% Set hit threshold
thresh = 2;     % {m}
% Define gravity
g = 9.81;       % {m/s^s}

% Initialize time, x & y vectors
% Choose # of time increments to use for calculations & plot
n_incr = 500;
% Set size of vectors
n_pts = n_incr+1;
% Create empty vectors
t = zeros(1,n_pts);
x = zeros(1,n_pts);
y = zeros(1,n_pts);
% Set initial value of x_end
x_end = x(n_pts);

% Create figure window & set up title, labels, etc.
% Open/activate Figure 1 window
figure(1)
% Add title, labels
title('Cannonball Trajectory')
xlabel('Distance [m]')
ylabel('Height [m]')
% Turn hold on so plots don't overwrite figure
hold on
% Setting the axis limits is optional
% Set limits on x & y axes to be equal
% Minimums = zero
x_min = 0;
y_min = 0;
% Calculate maximums based on target distance
x_max = 1.2 * x_trgt;
% Round x_max up to nearest 100 
% (add 50 to ensure rounding up, round to 2 places to the left of decimal)
x_max = round(x_max+50,-2);
% Set y_max equal to x_max
y_max = x_max;
% Set axis limits in figure
axis([x_min x_max y_min y_max])

% Main while loop to play game
% Continue asking user for v0 & Theta until they get close enough to target
while abs(x_end-x_trgt) > thresh
    % Get user input for v0 & theta
    v0 = input('Enter initial velocity in m/s: ');      % {m/s}
    Theta = input('Enter launch angle in degrees: ');   % {deg}
    % Calculate values for time vector
    % Final (impact) time
    t_end = (2*v0*sind(Theta)) / g; % {s}
    % Time increment between points in time vector
    t_incr = t_end / n_incr;        % {s}
    % For loop to fill in t, x & y vectors
    for n = 1:n_pts
        t(n) = (n-1) * t_incr;                      % {s}
        x(n) = v0*cosd(Theta)*t(n);                 % {m}
        y(n) = v0*sind(Theta)*t(n) - 0.5*g*t(n)^2;  % {m}
    end
    % Pull out final (impact) x-distance
    x_end = x(n_pts);
    % Tell user where they hit
    fprintf('Shot landed %0.1f m downrange.\n',x_end)
    % Plot trajectory using animated comet plot
    comet(x,y)
    % This pause function forces MATLAB to pause for a given number of
    % seconds, giving the graphics time to draw the comet plot before
    % moving on.
    pause(0.5);
end

% While loop only ends when condition is false (i.e., x_end within thresh
% of x_trgt)
fprintf('Target hit!\nGame over.\n')

    
