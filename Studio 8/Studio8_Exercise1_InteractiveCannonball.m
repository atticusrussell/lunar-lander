%% MECE-117 Intro to Programming for Engineers
% Prof. Humphrey
% Studio- Week 8
% Interactive GUI cannonball code

%% Main program
clear
clc
% Create global variables for functions & user interface items
global g shots shotmax target closenough
global VelocityBox AngleBox DistanceBox TargetBox
% Initialize variables
g = 9.81;           % [m/s^2]
shots = 0;          % set shot counter to zero
shotmax = 10;       % how many shots does user get
closenough = 2;     % how close the impact distance needs to be to win
% Randomize target distance between 1500 & 2000 m
target = 1500 + fix(500*rand(1));

% Call function to create figure window for app
FigureSetUp

% Note that main program is done! The uicontrol for the pushbutton runs the
% @Shoot function when pressed. User should just close figure when done.
fprintf('The main program has finished!')

% End of main program




%% Functions
function FigureSetUp()
% Provide access to global variable
global target
%make stuff global
global VelocityBox AngleBox DistanceBox TargetBox
% Create 'sticky' figure for trajectory input/output
% Set up figure 'frame' of specified size: [left bottom width height]
figure('Position', [30,70,1030,570]) 
% Define lengths of axes within figure window: [left bottom width height]
axes('Units', 'pixels', 'Position', [70,30,750,530])
% Set axis scaling to be equal units and set min & max value for each axis
% [xmin xmax ymin ymax]
axis equal
axis([0,2500,0,1500])
% Create axis & figure labels
xlabel('Distance (m)')
ylabel('Height (m)')
title('Cannonball Trajectory')
% 'Pin' figure so it is not refreshed when additional plots created
hold on

% Create I/O controls in figure window
% Create editable text box for user to enter v0, w/ initial value of 150 
VelocityBox = uicontrol('Style', 'edit', 'String', '150', ...
    'Position', [880, 300, 80, 20]);
% Create label on VelocityBox
uicontrol('Style', 'Text', 'String', 'Launch Velocity (m/s)', ...
    'Position', [850, 320, 150, 20])
% Create editable text box for user to input theta, w/ initial value of 50
AngleBox = uicontrol('Style', 'edit', 'String', '50', ...
    'Position', [880, 240, 80, 20]);
% Create label on AngleBox
uicontrol('Style', 'text', 'String', 'Elevation Angle (degrees)', ...
    'Position', [850, 260, 150, 20])
% Create editable text box for code to show impact distance, w/ no initial
DistanceBox = uicontrol('Style', 'edit', 'String', '--', ...
    'Position', [880, 380, 80, 20]);
% Create label on DistanceBox
uicontrol('Style', 'text', 'String', 'Impact Distance (m)', ...
    'Position', [845, 400, 150, 20])
% Create editable tex box for code to show target distance
TargetBox = uicontrol('Style', 'edit', 'String', num2str(target), ...
    'Position', [880, 440, 80, 20]);
% Create label on TargetBox
uicontrol('Style', 'text', 'String', 'Target Distance (m)', ...
    'Position', [845, 460, 150, 20])
% Create Fire! button that calls Shoot function when pressed
uicontrol('Style', 'pushbutton', 'String', 'Fire!', ...
    'Position', [880, 170, 80, 30], ...
    'Callback', @Shoot)
end


function Shoot(pushbutton, ~)
% Function that calculates trajectory when Fire! button pressed
% Provide access to global variables
global g shots shotmax target closenough 
global VelocityBox AngleBox DistanceBox TargetBox

% calculate trajectory
% increment shots
shots=shots+1;
%get user input for shot
v0=str2num(VelocityBox.String);
theta=str2num(AngleBox.String);



r=5;


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

%calculating x and y
n=1:nmax;
    t(n)=(n-1)*tinc;
    x(n)=v0*cosd(theta)*t(n);
    y(n)=v0*sind(theta)*t(n)-(0.5*g*(t(n)).^2);

r=x(n)-target;
hold on
comet(x,y)
plot(target,0,'*')
if 2<=r
    uicontrol('Callback', @CleanUp)
    disp('you win')
    
end


end


function CleanUp()
% Clear figure windows when done
% 'Unpin' figure window
hold off
% Close all open figure windows
close all
end



