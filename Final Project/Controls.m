%MECE-117 
%Atticus Russell
%3/28/19
%Final project lunar lander

clc
clear
close all

global dx_shp dy_shp quitgame
quitgame = false;

%Create Figure window and set location, width, height
fig1 = figure('Name','Moon Landing','Position',[75,100,1400,600],...
    'color','black');


%Create axes centered in figure// define axis limits
xmax =300;
xmin = -xmax;
ymax = xmax;
ymin = xmin;

%Create axis with equal aspect ratio, turn off
%auto-scaling, turn off display of axis
axis([xmin  xmax  ymin  ymax])
axis equal
axis manual
axis on
grid on

% register KeyDownListener with the figure
set(fig1,'KeyPressFcn', @KeyDownListener);

%Create 'patch' for spaceship
%create array for spaceship
SHIP = [-5.00,-7.00,-7.00,-5.00, -8.00, -8.00, -5.00, -8.00, -7.00,-4.00 -1.00,-2.00, 2.00, 1.00, 4.00,  7.00,  8.00, 5.00, 8.00, 8.00, 5.00, 7.00, 7.00,5.00; ...
         9.00, 6.00, 2.00,-1.00, -1.00, -5.00, -5.00,-13.00,-13.00,-6.00,-6.00,-9.00,-9.00,-6.00,-6.00,-13.00,-13.00,-5.00,-5.00,-1.00,-1.00, 2.00,6.00,9.00];

%Scale ship to make it more visible
SHIPscale = 2;
SHIP = SHIPscale*SHIP;

Shp_Patch = patch(SHIP(1,:),SHIP(2,:),'w');


%colors
%orange
orn=[0.8500 0.3250 0.0980];
%red orange
ron=[255 127 63];
%red 
red=[1 0 0];
%yellow
yel=[1 1 0];
%light blue
lib=[0.3010 0.7450 0.9330];
%white
wht=[1 1 1];
%light pink
lpk=[254 85 85];

%x and y coordinates of flame
fys=0.4;  
flamex=[-15,000,015,    020,    025,     030,     035,     025,     028,     020,     018,     015,     010,     005,     002,     000,     -02,     -05,     -10,     -15,     -18,     -20,     -28,     -25,     -35,     -30,    -25,    -20];
flamey=[-20,-20,-20,-50*fys,-70*fys,-100*fys,-150*fys,-140*fys,-180*fys,-150*fys,-170*fys,-180*fys,-200*fys,-160*fys,-205*fys,-225*fys,-205*fys,-160*fys,-200*fys,-180*fys,-170*fys,-150*fys,-180*fys,-140*fys,-150*fys,-100*fys,-70*fys,-50*fys];
varray=[wht;wht;wht;wht;yel;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;yel;wht];
fxscale=0.5;       
%fyscale
   
flamexadj=flamex*fxscale;
size(varray);
size(flamey);

f=patch('XData',flamexadj,'YData',flamey);
f.FaceVertexCData=varray;
f.FaceColor='interp';



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
