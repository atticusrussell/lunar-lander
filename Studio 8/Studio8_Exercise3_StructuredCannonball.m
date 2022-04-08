% MECE-117 Intro to Programming
% Studio Week 8 - Exercise #1
% Structured Cannonball Game

%% Main Program

% Basic Initialization
CleanStart
% Create global variables for tracking # of shots
global shots shot_max
% Prepare game
[x_trgt, trgt_thresh, game_over, win] = GameStart;
% Set up Figure
FigSetUp(x_trgt);
% Game Loop - runs as long as game_over is not true
while ~game_over
    % Get user input for shot
    [Vo,A] = UserIn;
    % Calculate trajectory
    [x,y] = Trajectory(Vo,A);
    % Plot shot trajectory
    PlotShot(x,y)
    % Check for win/lose
    [game_over,win] = WinCheck(x,x_trgt,hit_thresh);
end
% Game Over
GameEnd


%% Functions


% Function CleanStart
% Clears out all previous MATLAB activity - clear workspace variables,
% close all figures, clear command window
% Input:  none
% Output: none
function [] = CleanStart()
 

end


% Function GameStart
% Set up game
% Input:  none
% Output: trgt_dist  - target distance {m}
%         game_over  - logical to inidcate if game is over
%         game_win   - logical to inidcate if game won
% Global: shots      - number of shots fired
%         shot_max   - number of shots allowed
function [trgt_dist,thresh,game_over,game_win] = GameStart()
    

end


% Function FigSetUp
% Set up Figure for plotting trajectories
% Input: trgt_dist  - target distance {m}
% Output: none
function [] = FigSetUp(trgt_dist)


end


% Function UserIn
% Get user input for shot
% Input:  none
% Output: V_intl  - cannonball initial velocity {m/s}
%         theta   - angle between initial velocity and horiontal {degrees}
% Global: shots   - number of shots fired
function [V_intl,theta] = UserIn()
    

end


% Function Trajectory
% Compute cannonball trajectory
% Input:  V_intl  - initial velocity {m/s}
%         theta   - launch angle above horizontal {degrees}
% Output: dist    - vector of horizontal distances for trajectory {m}
%         height  - vector of vertical heights for trajectory {m}
function [dist,height] = Trajectory(V_intl,theta)
    

end


% Function PlotShot
% Use comet plot to display animated cannonball trajectory
% Input:  dist    - vector of horizontal distances for trajectory {m}
%         height  - vector of vertical heights for trajectory {m}
% Output: none
function [] = PlotShot(dist,height)
    

end


% Function WinCheck
% Check to see if shot hit within threshold distance of target distance, 
% set game_over & game_win to true if so. Otherwise, increment shot count 
% and set game_over to true if greater than shot limit.
% Input:  dist       - vector of horizontal distances for trajectory {m}
%         trgt_dist  - distance to target {m}
%         thresh     - hit radius threshold {m}
% Output: game_over  - logical to inidcate if game is over
%         game_win   - logical to inidcate if game won
function [game_over,game_win] = WinCheck(dist,trgt_dist,thresh)
    

end


% Function GameEnd
% Clean up after game
% Input:  none
% Output: none
function [] = GameEnd()
    

end