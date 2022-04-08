%Atticus Russell
%3/21/2019
%MECE-117
%Homework 8 Problem 3
%%  Program

% Basic Initialization
CleanStart
% Create global variables for tracking # of shots
global shots shot_max
% Prepare game
[trgt_dist, thresh, game_over, game_win] = GameStart;
% Set up Figure
FigSetUp(trgt_dist);
disp('Target distance')
disp(trgt_dist)
% Game Loop - runs as long as game_over is not true
while ~game_over
    % Get user input for shot
    [V_intl,theta] = UserIn();
    % Calculate trajectory
    [dist,height] = Trajectory(V_intl,theta);
    
    % Plot shot trajectory
    PlotShot(dist,height);
    % Check for win/lose
    [game_over,game_win] = WinCheck(dist,trgt_dist,thresh);
end
% Game Over
GameEnd();


%% Functions


% Function CleanStart
% Clears out all previous MATLAB activity - clear workspace variables,
% close all figures, clear command window
% Input:  none
% Output: none
function [] = CleanStart()
 close all 
 clear
 clc
end


% Function GameStart
% Set up game
% Input:  none
% Output: trgt_dist  - target distance {m}
%         game_over  - logical to inidcate if game is over
%         game_win   - logical to inidcate if game won
% Global: shots      - number of shots fired
%         shot_max   - number of shots allowed
function [trgt_dist,thresh,game_over,game_win] = GameStart();
global shots shot_max
trgt_dist=randi([2000 5000],1,1);
thresh=20;


 game_win=false;
 game_over=false;  
end



function [] = FigSetUp(trgt_dist);
figure('Position',[30,70,1030,570]);
axes('Units','pixels','Position',[70,30,750,530]);
axis equal;
axis([0,5500,0,1500]);
xlabel('Distance (meters)');
ylabel('Height (meters)');
title('Cannonball Trajectory');
 hold on


end



function [V_intl,theta] = UserIn()
   
    V_intl=input('Input Velocity:');
    theta=input('Input Degrees:');
end



function [dist,height] = Trajectory(V_intl,theta);
    x_end=0;
    inc=100;
    diff=100;
    t_end = (2*V_intl*sind(theta)) / 9.81;
    
    ninc=t_end/inc;
    T=linspace(0,t_end,inc);
    dist=V_intl*cosd(theta).*T;
    height=V_intl*sind(theta).*T-.5*9.81*T.^2;
    
    

    

end




function [] = PlotShot(dist,height);
 global   shots shotmax
if shots<=shotmax;
    comet(dist,height); 
else
    disp('Loser');
    GameEnd();
end
end



function [game_over,game_win] = WinCheck(dist,trgt_dist,thresh);
global shots shotmax 
lolypop=abs(dist-trgt_dist);
shotmax=500;

if lolypop<=thresh; 
    game_over=true;
    game_win=true;
    disp('you win');
else
shots=shots+1;
if shots>shotmax;
    disp('you lose');
    game_win=false;
    game_over=true;
else
    disp('Distance from target');
    disp(abs(dist-trgt_dist));
    game_over=false;
    game_win=false;
end

end

end



function [] = GameEnd();
   hold off 
   close all

end