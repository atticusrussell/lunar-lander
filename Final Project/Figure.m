%Atticus Russell
%MECE 117
%3/27/19
%Final Project - Lunar lander
%Figure

clc


%determine the screeen resolution 
screensize=get(0,'ScreenSize');

%create figure window
fig1=figure('Position', [10,100,600,600],'color','black');
%create axes centered in figure

% define axis limits
xmax=150;
xmin=-xmax;
ymax=xmax;
ymin=xmin;

%create axis with equal aspect ratio, turn off auto scaling, and turn off
%display of axis
axis([xmin xmax ymin ymax])
axis equal
axis manual
axis off
    

%create spaceship "patch"

%coordinates of polygons defining spaceship shape
ship=[0.00, 1.00, 4.00, 1.00, 0.00,-1.00,-4.00,-1.00; ...
    -2.50,-0.75,-1.50, 1.50, 5.00, 1.50, -1.50, -0.75];

%scale ship for visibility
shipscale=2;
ship=shipscale*ship;

%create patch, move it to point (Xs,Ys) and make it blue
    %-Xs and Ys are the x and y position of the ship 
Xs=35;
Ys=35;
    %-variable shippatch contains the 'handle' to the patch
shippatch=patch(ship(1,:)+Xs,ship(2,:)+Ys,'w'); 



%create for loop to calculate Xs and Ys as a function of theta % r_orbit
    %-within the for loop use the set function to relocate shippatch for
    %each value of theta 
r_orbit=100;
theta=0:pi/180:8*pi;
z=length(theta);

for   n=1:z
    X=r_orbit*cos(theta(n));
    Y=r_orbit*sin(theta(n));
    %set(shippatch,'XData',ship(1,:)+Xs,'YData',ship(2,:)+Ys);
    %add a pause after the set to see the movement
    %pause(0.05)

 %add rotation of the ship as it orbits
    %create a rotation matrix
RtnMatrix=[cos(-theta(n)) sin(-theta(n)); -sin(-theta(n)) cos(-theta(n))];
    %multiply the ship coordinates by the rotation matrix before moving it
    %to (Xs,Ys)
ship2=RtnMatrix*ship; %matrix multiplication

set(shippatch,'XData',ship2(1,:)+X,'YData',ship2(2,:)+Y)
pause(0.001)

end


