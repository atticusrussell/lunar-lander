%MECE-117 
%Atticus Russell
%3/28/19
%Studio 10 Problem 1

clc
clear
close all

global dx_shp dy_shp quitgame
quitgame = false;

%Create Figure window and set location, width, height
fig1 = figure('Position', [50,10,600,600],'color','black');


%Create axes centered in figure// define axis limits
xmax = 150;
xmin = -xmax;
ymax = xmax;
ymin = xmin;

%Create axis with equal aspect ratio, turn off
%auto-scaling, turn off display of axis
axis([xmin  xmax  ymin  ymax])
axis equal
axis manual
axis off

% register KeyDownListener with the figure
set(fig1,'KeyPressFcn', @KeyDownListener);

%Create 'patch' for spaceship
%create array for spaceship
SHIP = [0.00, 1.00, 4.00, 1.00, 0.00,-1.00,-4.00,-1.00; ...
        -2.50,-0.75,-1.50, 1.50, 5.00, 1.50,-1.50,-0.75];

%Scale ship to make it more visible
SHIPscale = 2;
SHIP = SHIPscale*SHIP;

Shp_Patch = patch(SHIP(1,:),SHIP(2,:),'w');

dx_shp = 0;
dy_shp = 0;
while ~quitgame
set(Shp_Patch,'XData',SHIP(1,:)+dx_shp,'YData',SHIP(2,:)+dy_shp)
pause(0.005)
end
close all

function KeyDownListener(src,event)
global dx_shp dy_shp quitgame
val = event.Key;
switch val
    case 'rightarrow'
        dx_shp = dx_shp+5;
    case 'leftarrow'
        dx_shp = dx_shp-5;
    case 'uparrow'
        dy_shp = dy_shp+5;
    case 'downarrow'
        dy_shp = dy_shp-5;
    case 'q'
        quitgame = true;
     otherwise
          val
   end
end
