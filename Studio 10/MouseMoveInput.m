clc;
clear;
global CP m_b dx_blk2 dy_blk2 quitGame
% Initialize game and table parameters
[lgth_table, wdth_table, edge_wdth, val] = Setup();
% Create table
[AHT] = createTable(lgth_table,wdth_table,edge_wdth);
% Set parameters for blockers
[r_blkr, Xb1, Yb1, Xb1_limit, Yb1_limit] = BlockerSetup(lgth_table,...
    wdth_table);
% Create the blockers
[xblkr1,yblkr1,blkr1] = makeBlkr(m_b,r_blkr);
set(blkr1,'XData',xblkr1 + Xb1);
% Initialize mouse location
CP = [ 0.500 0.000 -1.000; 0.500 0.000 1.000];
n = 0;
pause(1);
while quitGame ~= true
    n=n+1;
    Xb1 = CP(1,1);
    Yb1 = CP(1,2);
    [Xb1,Yb1] = Blkr1_limits(Xb1,Yb1,Xb1_limit,...
         Yb1_limit,r_blkr);
% Move Blockers to their new positions
    set(blkr1,'XData',xblkr1 + Xb1,'YData',yblkr1 + Yb1);     
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

% register MouseMoveListener with the figure
set(AHT,'WindowButtonMotionFcn', @MouseMoveListener);
end

function [r_blkr, Xb1, Yb1,Xb1_limit, Yb1_limit] = BlockerSetup(lgth_table,...
    wdth_table)
    r_blkr = 0.050;                         %Radius of Blocker[m]
    Xb1 = lgth_table/4;                                             %[m]
    Yb1 = 0;                                                        %[m]
    Xb1_limit = lgth_table/2 - 0.006 - r_blkr;                      %[m]
    Yb1_limit = wdth_table/2 - 0.006 - r_blkr;                      %[m]
end

function [x,y,blkr] = makeBlkr(m,r)
    ang = 0:pi/45:2*pi;
    ratio = 1;
    rdisp = r * ratio;
    x = rdisp.*cos(ang);
    y = rdisp.*sin(ang);
    blkr = patch(x,y,'black');
end

function MouseMoveListener (src, eventdata)
    global CP 
    CP = get(gca,'CurrentPoint');
    title(gca, ['(X,Y) = (', num2str(CP(1,1)), ', ',num2str(CP(1,2)), ')']);
end

function [x1,y1] = Blkr1_limits(x1,y1,x1_limit,y1_limit,blk_rad)
    ntstep = 3;
    if x1 > x1_limit
        x1 = x1_limit;
    end
    if x1 < blk_rad
        x1 = blk_rad;
    end
     if y1 > y1_limit
        y1 = y1_limit;
    end
    if y1 < -y1_limit
        y1 = -y1_limit;
    end
end
