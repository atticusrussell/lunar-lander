clc;
clear;
global CP dx_blk2 dy_blk2 quitGame
% Initialize game and table parameters
[lgth_table, wdth_table, edge_wdth, val] = Setup();
% Create table
[AHT] = createTable(lgth_table,wdth_table,edge_wdth);
% Set parameters for blockers
[r_blkr, Xb2o, Yb2o, Xb2_limit, Yb2_limit] = ...
    BlockerSetup(lgth_table, wdth_table);
% Create the blocker
[xblkr2,yblkr2,blkr2] = makeBlkr(r_blkr);
Xb2 = Xb2o;
Yb2 = Yb2o;
set(blkr2,'XData',xblkr2 + Xb2);
% Initialize mouse location
CP = [ 0.500 0.000 -1.000; 0.500 0.000 1.000];
n = 0;
pause(1);
while quitGame ~= true
    n=n+1;
    Xb2 = Xb2o + dx_blk2;
    Yb2 = Yb2o + dy_blk2;
    [Xb2,Yb2] = Blkr2_limits(Xb2, Yb2, Xb2o, Yb2o, Xb2_limit,...
         Yb2_limit, r_blkr);
% Move Blocker to its new positions
    set(blkr2,'XData',xblkr2 + Xb2,'YData',yblkr2 + Yb2); 
    pause(0.005);
end
close all;

function [l_tbl, w_tbl, w_edg, val] = Setup()
    global quitGame 
    quitGame = false;
    l_tbl = 2.000;                      %[m]
    w_tbl = 1.000;                      %[m]
    % Width of rectangle border
    w_edg = 6;                          %[pixels]
    % Initialize value for keyboard inputs
    val=[];                             %
end

function [AHT] = createTable(l_tab,w_tab,w_edg)
% Get the size of the screen and set the figure size on the screen
scrnsize = get(0,'ScreenSize');
x = 25;
y = 40;
w = scrnsize(3) - 3*x;
h = scrnsize(4) - 5*y;

%AHT = air hockey table figure
AHT = figure('Position',[x,y,w,h]);
whitebg('cyan');
% Set the location of the axes on the figure
axes('Position',[0.05,0.05,0.95,0.85]); 
% Set the range of values for each axis
axis([-1.1*l_tab/2,1.1*l_tab/2,-1.1*w_tab/2,1.1*w_tab/2]);
AHTSurf = rectangle('Position',[-l_tab/2,-w_tab/2,l_tab,w_tab],...
    'FaceColor','white','LineWidth',w_edg,'EdgeColor','black'); 
axis equal
axis off
axis manual

hold on

% register KeyDownListener with the figure
set(AHT,'KeyPressFcn', @KeyDownListener);
end

function [r_blkr, Xb2o, Yb2o, Xb2_limit,Yb2_limit] = ...
    BlockerSetup(lgth_table, wdth_table)
    global dx_blk2 dy_blk2 
    dx_blk2 = 0;
    dy_blk2 = 0;
    r_blkr = 0.050;                         %Radius of Blocker[m]
    Xb2o = -lgth_table/4;
    Yb2o = 0;
    Xb2_limit = -lgth_table/2 + 0.006 + r_blkr;                      %[m]
    Yb2_limit = wdth_table/2 - 0.006 - r_blkr;                      %[m]
end

function [x,y,blkr] = makeBlkr(r)
    ang = 0:pi/45:2*pi;
    ratio = 1;
    rdisp = r * ratio;
    x = rdisp.*cos(ang);
    y = rdisp.*sin(ang);
    blkr = patch(x,y,'black');
end

function KeyDownListener(src,event)
global dx_blk2 dy_blk2 quitGame
    val = event.Key;
    switch val
      case 'q'
        quitGame = true;
      case 'd'
        dx_blk2 = dx_blk2+0.03;
     case 'a'
        dx_blk2 = dx_blk2-0.03;
     case 'w'
        dy_blk2 = dy_blk2+0.03;
     case 's' 
        dy_blk2 = dy_blk2-0.03;
     otherwise
          val
   end
end


function [x2,y2] = Blkr2_limits(x2, y2, xb2o, yb2o, x2_limit,y2_limit,blk_rad)
    global dx_blk2 dy_blk2
    if x2 < x2_limit
        x2 = x2_limit;
        dx_blk2 = x2 -xb2o;
    end
    if x2 > -blk_rad
        x2 = -blk_rad;
        dx_blk2 = x2 - xb2o;
    end
     if y2 > y2_limit
        y2 = y2_limit;
        dy_blk2 = y2 - yb2o;
    end
    if y2 < -y2_limit
        y2 = -y2_limit;
        dy_blk2 = y2 - yb2o;
    end
 end
