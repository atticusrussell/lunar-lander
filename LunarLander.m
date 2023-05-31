%MECE-117 
%Atticus Russell
%4/26/19
%Final project lunar lander

clc
clear
close all

%% initialize variables
global dx_shp dy_shp quitgame theta tinc Vx Vy thrust mass fuel mass_f distmoon stagereset landings maxthrust xmax ymax xmin ymin missed landingphase resetcount
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
maxthrust=1000000; %max thrust is a million
mass=10000; %[kg] set initial mass equal to 15000 [kg]
fuel=1000; %set initial fuel to 1000 units
mass_f=1000; %set the mass of the fuel
dx_ship0=50; %inital x postition of ship
dy_ship0=850 ;%inital y postition of ship
dx_shp = dx_ship0; %set x pos to initial x pos
dy_shp = dy_ship0; %set y pos to initial y pos
SHIPlegs=20; %the distance from the ground that the ship will crash/land
xmax = 1800; %maximum value of x axis
xmin = 0; %minimum value x axis
ymax = 1000; %maximum value y axis
ymin = 0; %minimum value y axis
landingphase=false; %not low enough at start to be in landing phase
resetcount=0; %has not reset 
fys=1; %initial flame scale at one
fym=-SHIPlegs; %starting y position of flame
landings=0;
distmoon=dy_ship0;
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
grid off
%fancier axis properties
%make ax equal current axes (get current axes)
ax=gca;
%draw a box where the axes are (playable space)
ax.Box = 'on';
%make box outline white
ax.XColor='w';
ax.YColor='w';
%fill the box in black
ax.Color='k';
%disable ticks on both axes
ax.XTick=[];
ax.YTick=[];

%set the color limits of the figure
ax.CLim=[1 10];

%% call functions for rendering stuff 

%register KeyDownListener function with the figure
set(fig1,'KeyPressFcn', @KeyDownListener);

%define 'SHIP', scale it, and render the patch and the flame patch with the function 'shiprender'
[SHIP,Shp_Patch,f]=shiprender(fys,fym);

%define 'surface' 'moon' and 'moon_patch' with the function moonrender
[surface,moon,moon_patch]=moonrender();

%% Show controls and goals

%goals
goaltext=text(300,900,'Objectives','color','g','FontSize',30);
goaltext2=text(300,850,'Make as many landings as possible with the fuel provided','color','g','FontSize',20);
goaltext3=text(300,800,'Land with a velocity less than ten and angle parallel to the surface','color','g','FontSize',20);
pause(3)
delete(goaltext)
delete(goaltext2)
delete(goaltext3)


%print controls onto the screen
controltext=text(300,600,'Controls','color','r','FontSize',30);
controltext2=text(300,550,'w=increase thrust   s=decrease thrust','color','r','FontSize',20);
controltext3=text(300,500,'spacebar=full throttle   shift=engines off  ','color','r','FontSize',20);
controltext4=text(300,450,'a=rotate left   d=rotate right  ','color','r','FontSize',20);
controltext5=text(300,400,' q = quit the game (please don''t press q while its zoomed in or the game will break the next time it runs)','color','r','FontSize',15);
pause(5)
delete(controltext)
delete(controltext2)
delete(controltext3)
delete(controltext4)
delete(controltext5)
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
        '  angle:  ',num2str(round(rad2deg(theta))) ' degrees'],'color','white')
 
    %zoom in for the ship while landing 
    %make the view of ship zoom in
     if distmoon <  180 && landingphase==false
         ymax=400;
         ymin=0;
         xmax=dx_shp+200; %ymax*.9;
         xmin=dx_shp-200; %ymax*.9;
         axis([xmin  xmax  ymin  ymax])
         landingphase=true;
     end
     %make the zoomed window adjust if the bounds are exceeded
     if landingphase==true 
         if xmax<dx_shp || xmin>dx_shp
             ymax=400;
             ymin=0;
             xmax=dx_shp+200; %ymax*.9;
             xmin=dx_shp-200; %ymax*.9;
             axis([xmin  xmax  ymin  ymax])
         end
     end  
  
    %display the flame
    %scale the flame with the thrust by a constant
    fys=thrust/500000;
    %adjust the flame matrix accordingly
    flamematadj=flame(fys,fym);
    %make the flame not show up when theres zero thrust
    if thrust==0
        f.Visible='off';
    else
        f.Visible='on';
    end
    
    %call function for boundaries (missing landing zone
    boundaries(dx_ship0,dy_ship0,Vy0,Vx0);
    
    %call crash or land function
    crashland(surface,SHIPlegs,dx_ship0,dy_ship0,Vy0,Vx0);
    
    %fuel amount calculation (divided by 10k to make the game work)
    fuel=fuel-thrust*tinc/10000;
    
    %protocol for running out of fuel/ending the game
    endgame();
    
    %use the reset stage function
    resetstage();
 
    %ship physics below
    
    %mass of fuel
    mass_f_rem=mass_f*fuel*tinc/2;
    
    %mass of ship
    mass=10000+mass_f_rem;
     
    %y velocity and gravity
    Vy=Vy+2*thrust*cos(theta)*tinc/mass -g*tinc/mass;
    %x velocity
    Vx=Vx+2*thrust*-sin(theta)*tinc/mass;
    %velocity/place
    dx_shp=dx_shp+Vx*tinc;
    dy_shp=dy_shp+Vy*tinc;
    
    %rotation matrix for ship and flame
    RtnMatrix=[cos(-theta) sin(-theta); -sin(-theta) cos(-theta)];
    %ship with rotation matrix
    SHIP2=RtnMatrix*SHIP;
    %flame with rotation matrix 
    f2=RtnMatrix*flamematadj;
    %display and translate ship
    set(Shp_Patch,'XData',SHIP2(1,:)+dx_shp,'YData',SHIP2(2,:)+dy_shp);
    %display flame and translate
    set(f,'XData',f2(1,:)+dx_shp,'YData',f2(2,:)+dy_shp);
    
    pause(tinc)
end
axis([0  1800  0  1000])
close all



%% functions below

%% keyboard inputs (from studio)
function KeyDownListener(~,event)
global quitgame theta thrust maxthrust landingphase xmax xmin ymax ymin 
val = event.Key;
    switch val
    case 'space'
        thrust = maxthrust;
    case 'shift'
        thrust = 0;
    case 'uparrow'
        thrust=thrust+10000;
    case 'downarrow'
        thrust=thrust-10000;
        %configure thrust settings
    case 'w'
        if thrust>=1000000
            thrust=maxthrust;
        else
            thrust=thrust+10000;
        end
    case 's' 
        if thrust<=0
            thrust=0;
        else
            thrust=thrust-10000;
        end
        %set a to change the rotation of the ship every time its pressed
    case 'a'
        theta=theta+pi/16;
        %set d to change the rotation of the ship every time its pressed
    case 'd'
        theta=theta-pi/16;
        %make q make quitgame true (quit the game)
    case 'q'
        xmax=1800;
        xmin=0;
        ymax=1000;
        ymin=0;
        axis([xmin  xmax  ymin  ymax])
        landingphase=false;
        quitgame = true;
    otherwise
          %val;
   end
end

%% ship and flame render
function [SHIP,Shp_Patch,f] = shiprender(fys,fym)
%Create 'patch' for spaceship
%create array for spaceship
SHIP = [-5.00,-7.00,-7.00,-5.00, -8.00, -8.00, -5.00, -8.00, -7.00,-4.00 -1.00,-2.00, 2.00, 1.00, 4.00,  7.00,  8.00, 5.00, 8.00, 8.00, 5.00, 7.00, 7.00,5.00; ...
         9.00, 6.00, 2.00,-1.00, -1.00, -5.00, -5.00,-13.00,-13.00,-6.00,-6.00,-9.00,-9.00,-6.00,-6.00,-13.00,-13.00,-5.00,-5.00,-1.00,-1.00, 2.00,6.00,9.00];

%Scale ship to make it more visible  
%choose scale
SHIPscale = 1.5;
%multiply ship matrix by scale
SHIP = SHIPscale*SHIP;
%define the ship patch
Shp_Patch = patch(SHIP(1,:),SHIP(2,:),'w');

%colors
%orange
orn=[0.8500 0.3250 0.0980];
%red orange
%ron=[255 127 63];
%red 
%red=[1 0 0];
%yellow
yel=[1 1 0];
%light blue
%lib=[0.3010 0.7450 0.9330];
%white
wht=[1 1 1];
%light pink
%lpk=[254 85 85];

%x and y coordinates of flame
%flame ymin

flamex=[-15,000,015,    020,    025,     030,     035,     025,     028,     020,     018,     015,     010,     005,     002,     000,     -02,     -05,     -10,     -15,     -18,     -20,     -28,     -25,     -35,     -30,    -25,    -20];
flamey=[fym,fym,fym,fym-50*fys,fym-70*fys,fym-100*fys,fym-150*fys,fym-140*fys,fym-180*fys,fym-150*fys,fym-170*fys,fym-180*fys,fym-200*fys,fym-160*fys,fym-205*fys,fym-225*fys,fym-205*fys,fym-160*fys,fym-200*fys,fym-180*fys,fym-170*fys,fym-150*fys,fym-180*fys,fym-140*fys,fym-150*fys,fym-100*fys,fym-70*fys,fym-50*fys];
varray=[wht;wht;wht;wht;yel;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;orn;yel;wht];
fxscale=0.7;       
flamexadj=flamex*fxscale;

f=patch('XData',flamexadj,'YData',flamey);
f.FaceVertexCData=varray;
f.FaceColor='interp';

end


function [flamematadj]= flame(fys,fym)
fxscale=0.7;       
flamex=[-15,000,015,    020,    025,     030,     035,     025,     028,     020,     018,     015,     010,     005,     002,     000,     -02,     -05,     -10,     -15,     -18,     -20,     -28,     -25,     -35,     -30,    -25,    -20];
flamexadj=flamex*fxscale;
flamey=[fym,fym,fym,fym-50*fys,fym-70*fys,fym-100*fys,fym-150*fys,fym-140*fys,fym-180*fys,fym-150*fys,fym-170*fys,fym-180*fys,fym-200*fys,fym-160*fys,fym-205*fys,fym-225*fys,fym-205*fys,fym-160*fys,fym-200*fys,fym-180*fys,fym-170*fys,fym-150*fys,fym-180*fys,fym-140*fys,fym-150*fys,fym-100*fys,fym-70*fys,fym-50*fys];
flamematadj=[flamexadj;flamey];
end

%% moon surface render
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

 %% physics function
%function [f2,SHIP2]= shipphysics(SHIP,flamematadj)
% global mass mass_f fuel tinc dx_shp dy_shp Vy Vx thrust theta g
%     
%     
% end

%% crash or land function
function crashland(surface,SHIPlegs,dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset distmoon dy_shp dx_shp Vy Vx fuel xmax xmin ymax ymin theta landings
    if dy_shp<1000
        %initialize counter
        n=1;
        %check for collisons
        while surface(1,n)<dx_shp
            n=n+1;
        end
        %figure out properties about the ground below
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
                    %figure out how to put the message in the middle of the
                    %screen
                    landaxes=gca;
                    landx=landaxes.XLim;
                    landy=landaxes.YLim;
                    landxmiddle=(landx(1,1)+landx(1,2))/2;
                    landymiddle=(landy(1,1)+landy(1,2))/2;
                    %display the fact that it landed in text
                    wintext=text(landxmiddle,landymiddle,'Successful Landing: +100 fuel','color','g','FontSize',20);
                    %pause the program for a second
                    pause(1)
                    %delete the text
                    delete(wintext)                    
                    %add 100 fuel
                    fuel=fuel+100;        
                    landings=landings+1;
                    %reset land to false
                    %land=false;                    
                end
            else
                crash=true;
                if crash == true
                    %figure out how to put the message in the middle of the
                    %screen
                    crashaxes=gca;
                    crashx=crashaxes.XLim;
                    crashy=crashaxes.YLim;
                    crashxmiddle=(crashx(1,1)+crashx(1,2))/2;
                    crashymiddle=(crashy(1,1)+crashy(1,2))/2;
                    %display the fact that it crashed in text
                    failtext=text(crashxmiddle,crashymiddle,'You Crashed: -100 fuel','color','r','FontSize',20);
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
                    %crash=false;
                end
            end
            stagereset=true;
            resetstage(dx_ship0,dy_ship0,Vy0,Vx0);
        end         
    end
end 

%% out of bounds function
function boundaries(dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset fuel dx_shp dy_shp 
    if dx_shp<1 || dx_shp>1799 || dy_shp>999
        %figure out how to put the message in the middle of the screen
        missaxes=gca;
        missx=missaxes.XLim;
        missy=missaxes.YLim;
        missxmiddle=(missx(1,1)+missx(1,2))/2;
        missymiddle=(missy(1,1)+missy(1,2))/2;
        %display the fact that it crashed in text
        missedtext=text(missxmiddle-500,missymiddle,'You Missed the Landing Zone: -100 fuel','color','r','FontSize',30);
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

%% reset stage function
function resetstage(dx_ship0,dy_ship0,Vy0,Vx0)
global stagereset dx_shp dy_shp Vx Vy thrust xmax xmin ymax ymin resetcount landingphase distmoon
 %reset everything (except for fuel and mass) to how it was at the start
 %of the game after the ship hits the ground
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
        distmoon=900;
        landingphase=false;
        stagereset = false; 
        resetcount=resetcount+1;  
     else
     end
end
%% game end function
function endgame()
global fuel thrust dx_shp dy_shp landings quitgame
%if theres no fuel left, kill the thrust, and display to the user that the
%game is over, and their score. wait a bit and then end the game
    if fuel<0 
        thrust=0;
        endtext=text(dx_shp-100,dy_shp,'GAME OVER: No fuel','color','r','FontSize',30);
        pause(2)
        delete(endtext)
        scoretext=text(dx_shp-100,dy_shp,['Number of successful landings:' num2str(landings)],'color','g','FontSize',30);
        pause(2)
        delete(scoretext)
        quitgame=true;
    end
end