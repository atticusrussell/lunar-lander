%MECE-117 
%Atticus Russell
%3/28/19
%Final project lunar lander

clc
clear
close all


%% initialize variables
global dx_shp dy_shp quitgame theta tinc Vx Vy thrust mass fuel mass_f distmoon stagereset xmax ymax xmin ymin missed landingphase resetcount surfaceslopedeg
quitgame = false; %set quitgame as false, because we want to play the game
stagereset=false; %set stagereset to be false as well
missed=false;
theta=0; %set theta to be zero at the game start
tinc=0.008333; %[seconds] - set time increment - 0.008333 =120 fps 
Vx0=70; %set initial x velocity Vx0
Vx=Vx0; %make Vx=Vx0
Vy0=0; %set initial y velocity Vy0
Vy=Vy0; %make Vy=Vy0
g=90000; %set gravitational constant to a number where stuff works (no real units)
thrust=0; %make initial thrust equal zero
mass=10000; %[kg] set initial mass equal to 15000 [kg]
fuel=1000; %set initial fuel to 1000 units
mass_f=1000; %set the mass of the fuel
dx_ship0=50; %inital x postition of ship
dy_ship0=850 ;%inital y postition of ship
dx_shp = dx_ship0; %set x pos to initial x pos
dy_shp = dy_ship0; %set y pos to initial y pos
SHIPlegs=2; %the distance from the ground that the ship will crash/land
xmax = 1800; %maximum value of x axis
xmin = 0; %minimum value x axis
ymax = 1000; %maximum value y axis
ymin = 0; %minimum value y axis
landingphase=false;
resetcount=0;
surfaceslopedeg=0;
%% create the figure
%Create Figure window and set location, width, height
fig1 = figure('Name','Moon Landing','color','black',...
    'BackingStore','on','MenuBar','none', ...
    'position',[0 0 1800 1000]);

%% define things that dont need to be in the main game loop
%Create axes centered in figure/define axis limits

axis([xmin  xmax  ymin  ymax])

% turn off auto-scaling, turn on display of axis

axis manual
axis on
grid on
%fancier axis properties
%make ax equal current axes
ax=gca;
%draw a box where the axes are (playable space)
ax.Box = 'on';
%make box outline white
ax.XColor='w';
ax.YColor='w';
%fill the box in black
ax.Color='k';
%disable ticks on both axes
%ax.XTick=[];
%ax.YTick=[];
ax.CLim=[1 10];

%% call functions for rendering stuff 

%register KeyDownListener function with the figure
set(fig1,'KeyPressFcn', @KeyDownListener);

%define 'SHIP', scale it, and render the patch with the function 'shiprender'
[SHIP,Shp_Patch]=shiprender();

%define 'surface' 'moon' and 'moon_patch' with the function moonrender
[surface,moon,moon_patch]=moonrender();

%% Ship flame

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

flamex=[630,645,660,665,670,675,680,670,673,665,663,660,655,650,647,645,643,640,635,630,627,625,617,620,610,615,620,625];
flamey=[600,600,600,590,570,540,490,500,460,490,470,460,440,480,435,415,435,480,440,460,470,490,460,500,490,540,570,590];
varray=[wht;wht;wht;wht;yel;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;yel;wht];

size(varray);
size(flamey);

f=patch('XData',flamex,'YData',flamey);
f.FaceVertexCData=varray;
f.FaceColor='interp';




%% main program that runs while quitgame is false
while ~quitgame

    %title 
    title(['   x-velocity:   ',num2str(round(Vx)), ...
        '   y-velocity:   ',num2str(round(Vy)), ... 
        '   thrust:   ',num2str(thrust), ... 
        '   fuel:   ',num2str(round(fuel)), ...
        '  lander mass:   ',num2str(round(mass)) 'kg', ...
        '  x pos ship:   ',num2str(round(dx_shp)), ...
        '  y pos ship:   ',num2str(round(dy_shp)),...
        '  distance to the surface:  ',num2str(round(distmoon)),...
        '  surface slope:  ',num2str(surfaceslopedeg),...
        '  angle:  ',num2str(round(rad2deg(theta))) ' degrees'],'color','white')
        
    %view of ship
     if distmoon <  180 && landingphase==false
         ymax=distmoon+300;
         ymin=0;
         xmax=dx_shp+100; %ymax*.9;
         xmin=dx_shp-100; %ymax*.9;
         axis([xmin  xmax  ymin  ymax])
         landingphase=true;
     else
     end
    
  
    %display the flame
    
    %boundaries (missing landing zone
    boundaries(dx_ship0,dy_ship0,Vy0,Vx0);
    
    %call crash or land function
    crashland(surface,SHIPlegs,dx_ship0,dy_ship0,Vy0,Vx0);
    
    %fuel amount calculation (divided by 10k to make the game work)
    fuel=fuel-thrust*tinc/10000;
    %making thrust dependent on there being fuel left
    if fuel<0
        thrust=0;
    end
    %mass of fuel
    mass_f_rem=mass_f*fuel*tinc/2;
    
    %mass of ship
    mass=10000+mass_f_rem;
     
    %y velocity and gravity
    Vy=Vy+thrust*cos(theta)*tinc/mass -g*tinc/mass;
    %x velocity
    Vx=Vx+(thrust*-sin(theta)*tinc)/mass;
    %velocity/place
    dx_shp=dx_shp+Vx*tinc;
    dy_shp=dy_shp+Vy*tinc;
    
    %rotation
    RtnMatrix=[cos(-theta) sin(-theta); -sin(-theta) cos(-theta)];
    SHIP2=RtnMatrix*SHIP;
    
    resetcountprev=resetcount;
    
    %reset stage
    resetstage();
    
    if resetcount>resetcountprev
       landingphase=false;
    end

    
    %display and translate
    set(Shp_Patch,'XData',SHIP2(1,:)+dx_shp,'YData',SHIP2(2,:)+dy_shp)
    pause(tinc)
end
axis([0  1800  0  1000])
%landingphase=true;
close all



%% functions

%keyboard inputs (from studio)
function KeyDownListener(~,event)
global dx_shp quitgame theta thrust 
val = event.Key;
switch val
    case 'rightarrow'
        dx_shp = dx_shp+5;
    case 'leftarrow'
        dx_shp = dx_shp-5;
    case 'uparrow'
        thrust=thrust+10000;
    case 'downarrow'
        thrust=thrust-10000;
        %configure thrust settings
    case 'w'
        thrust=200000;
    case 's' 
        thrust=0;
        %set a to change the rotation of the ship every time its pressed
    case 'a'
        theta=theta+pi/16;
        %set d to change the rotation of the ship every time its pressed
    case 'd'
        theta=theta-pi/16;
        %make q make quitgame true (quit the game)
    case 'q'
        quitgame = true;
    otherwise
          val;
   end
end

function [SHIP,Shp_Patch] = shiprender()
%Create 'patch' for spaceship
%create array for spaceship
SHIP = [0.00, 1.00, 4.00, 1.00, 0.00,-1.00,-4.00,-1.00; ...
        -2.50,-0.75,-1.50, 1.50, 5.00, 1.50,-1.50,-0.75];
%Scale ship to make it more visible    
SHIPscale = 3;
SHIP = SHIPscale*SHIP;
Shp_Patch = patch(SHIP(1,:),SHIP(2,:),'w');
end


function [surface,moon,moon_patch] = moonrender()
%create a 'patch' for the lunar surface
%create an array for the surface
surface=[00,50,100,150,200,250,300,350,400,450,500,525,530,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1250,1300,1325,1350,1400,1450,1500,1550,1600,1650,1700,1750,1800;...
         10,40,060,060,030,010,010,020,050,100,100,125,130,175,300,300,100,125,115,075,075,060,0075,0085,0123,0200,0275,0275,0200,0200,0150,0020,0030,0050,0090,0140,0145,0100,0060,0040];
BL=[0;0]; %bottom left corner
BR=[1800;0]; %bottom right corner

moon=[BL,surface,BR]; 

%patch in the surface
moon_patch=patch(moon(1,:), moon(2,:),'w');
end

function crashland(surface,SHIPlegs,dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset distmoon dy_shp dx_shp Vy Vx fuel xmax xmin ymax ymin theta surfaceslopedeg
    if dy_shp<1000
        %initialize counter
        n=1;
        %check for collisons
        while surface(1,n)<dx_shp
            n=n+1;
        end
        xright=surface(1,n);
        xleft=surface(1,n-1);
        yright=surface(2,n);
        yleft=surface(2,n-1);
        surfaceslope=((yright-yleft)/(xright-xleft));
        surfaceslopedeg=atan(surfaceslope);
        ymoon=(surface(2,n)+surface(2,n-1))/2;
        distmoon=dy_shp-ymoon;
        if distmoon<SHIPlegs
            %assess whether crashed or landed
            if -10<Vy && abs(Vx)<10 && 20>abs(theta-surfaceslopedeg)
                land=true;
                if land == true
                    %display the fact that it landed in text
                    wintext=text(dx_shp-100,dy_shp,'Successful Landing: +100 fuel','color','g','FontSize',49);
                    %pause the program for a second
                    pause(1)
                    %delete the text
                    delete(wintext)                    
                    %add 100 fuel
                    fuel=fuel+100;                   
                    %reset land to false
                    land=false;                    
                end
            else
                crash=true;
                if crash == true
                    %display the fact that it crashed in text
                    failtext=text(dx_shp-100,dy_shp,'You Crashed: -100 fuel','color','r','FontSize',30);
                    %pause the program for a second
                    pause(1)
                    %delete the text
                    delete(failtext)       
                    %subtract 100 fuel
                    fuel=fuel-100;    
                    xmax=1800;
                    xmin=0;
                    ymax=1000;
                    ymin=0;
                    axis([xmin  xmax  ymin  ymax])
                    %reset crash to false
                    crash=false;
                end
            end
            stagereset=true;
            resetstage(dx_ship0,dy_ship0,Vy0,Vx0);
        end         
    end
end 

function boundaries(dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset fuel dx_shp dy_shp
    if dx_shp<1 || dx_shp>1799 || dy_shp>999
        %display the fact that it crashed in text
        missedtext=text(250,500,'You Missed the Landing Zone: -100 fuel','color','r','FontSize',30);
        %pause the program for a second
        pause(1)
        %delete the text
        delete(missedtext)       
        %subtract 100 fuel
        fuel=fuel-100;
        %make the stage reset
        stagereset=true;
        resetstage(dx_ship0,dy_ship0,Vy0,Vx0);
    end
end

function resetstage(dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset dx_shp dy_shp Vx Vy thrust xmax xmin ymax ymin resetcount 
 %reset after hit ground
     if stagereset==true
        dx_shp=dx_ship0;
        dy_shp=dy_ship0;
        Vx=Vx0;
        Vy=Vy0;
        thrust=0;
        xmax=1800;
        xmin=0;
        ymax=1000;
        ymin=0;
        axis([xmin  xmax  ymin  ymax])
        stagereset = false; 
        resetcount=resetcount+1;
     else
     end
end