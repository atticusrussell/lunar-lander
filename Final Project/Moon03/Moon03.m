function Moon03
%Version 0.3 (beta, so please, give feedback).
%
%This is a game and also an example of how to read/use keypress
%functionality from figures.
%
%This is a tribute to Moon Lander[1], without any lucrative pourpouse.
%
%The game opens a figure with the spaceship that must land on the square
%avoiding hitting the land.
%
%Use the arrows to turn the spaceship and the spacebar to fire the engine.
%
%
%  References:
%  [1] Lunar Lander, Game,
%      http://en.wikipedia.org/wiki/Lunar_Lander_%28video_game%29
%
%This function was written by :
%                             Héctor Corte
%                             B.Sc. in physics 2010
%                             M.Sc. in Complex physics systems 2012
%                             NPL (National Physical Laboratory), London,
%                             United kingdom.
%                             Email: leo_corte@yahoo.es
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%First prepare Figure and axes.
%Next create figure and prepare it for fun.
figure('MenuBar','none','Color','black',...
    'Resize','off','name','Moon Lander','position',[50,50,800,500],...
    'CloseRequestFcn','global j;j=1;','BackingStore','on','keypressfcn',@keypress,...
    'KeyReleaseFcn',@keyrelease);
set(gca,'color',[0 0 0])
%When BackingStore is on, MATLAB stores a copy of the Figure window in an off-screen pixel buffer. When obscured parts of the Figure window are exposed, MATLAB copies the window contents from this buffer rather than regenerating the objects on the screen.
%Using keypressfcn we can take control in real time of the game.
%%%Next define variables for spaceship terrain and physics.
global titan j again score firsttime
%This is just to stop the while
j=0;
%Define update interval (this can be adjust to faster computers)
dt=0.1;
score=0;
again=1;
firsttime=1;
while 1<2
    if again==1
        again=0;
        cla
        %Creates the spaceship
        titan=spaceship();
        %Render the intro
        render('intro')        
    else
        %This is the main bucle, it calls all the functions we need to play
        %(also the keypress function is allways working).
        %First check status of game
        check();
        %Then update the spaceship physics
        titan=physics_spaceship(titan,dt);
        %Render the game.
        render('');
        %make a sound if engine is on.
        if    titan.fire==1;
            engine_sound();            
        end        
        pause(dt)
        if j==1;
            clear titan terrain
            delete(gcf)
            break
        end
    end
end
end

function render(input_text)
%This puts every graphic in the figure.
global titan terrain terrain2 again score firsttime
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if strcmp(input_text,'intro')==1
    %This generates the intro and regenerates the terrain when landing or
    %crashing
        %First the land.
        terrain.xx=linspace(0,40,1000);
        terrain.yy=5+3*sin(0.1*(terrain.xx+10*rand())).*sin(0.4*terrain.xx+10*rand())+0.1*rand(1,1000).*sin(0.22*terrain.xx);
        terrain2.xx=linspace(0,40,1000);
        terrain2.yy=8+4*sin(0.1*(terrain.xx+10*rand())).*sin(0.4*terrain.xx+10*rand())+0.1*rand(1,1000).*sin(0.22*terrain.xx);
        area(terrain2.xx,terrain2.yy,'FaceColor',[0.25 0.25 0.25])
        hold on
        area(terrain.xx,terrain.yy,'FaceColor',[0.55 0.50 0.55])        
        %Then the landing pad.
        terrain.wx=10*rand()+5;
        i=min(find(min((terrain.xx-terrain.wx).^2)==(terrain.xx-terrain.wx).^2)) ;
        terrain.wy=terrain.yy(i)+0.5;  
        %Now some sprites
        %For the landing pad
        load('gamedata.mat')
        dock= patch('Faces',dockfaces,'Vertices',dockverts,'FaceColor','flat','FaceVertexCData',dockcdata,'EdgeColor','none');
        a=get(dock,'Vertices');
        b=a;
        b(:,1)=terrain.wx;
        b(:,2)=terrain.wy+0.5;
        set(dock,'Vertices',2.5*(a-0.5)+b);
        %Some moon bases        
        base1= patch('Faces',base1faces,'Vertices',base1verts,'FaceColor','flat','FaceVertexCData',base1cdata,'EdgeColor','none');
        a=get(base1,'Vertices');
        b=a;
        k=floor(1000*rand());
        b(:,1)=terrain.xx(k);
        b(:,2)=terrain.yy(k)/2;
        set(base1,'Vertices',3*(a-0.5)+b);
        base2= patch('Faces',base2faces,'Vertices',base2verts,'FaceColor','flat','FaceVertexCData',base2cdata,'EdgeColor','none');
        a=get(base2,'Vertices');
        b=a;
        k=floor(1000*rand());
        b(:,1)=terrain.xx(k);
        b(:,2)=terrain.yy(k)/2;
        set(base2,'Vertices',3*(a-0.5)+b);        
        base3= patch('Faces',base3faces,'Vertices',base3verts,'FaceColor','flat','FaceVertexCData',base3cdata,'EdgeColor','none');
        a=get(base3,'Vertices');
        b=a;
        k=floor(1000*rand());
        b(:,1)=terrain.xx(k);
        b(:,2)=terrain.yy(k)/2;
        set(base3,'Vertices',3*(a-0.5)+b);
        base4= patch('Faces',base4faces,'Vertices',base4verts,'FaceColor','flat','FaceVertexCData',base4cdata,'EdgeColor','none');
        a=get(base4,'Vertices');
        b=a;
        k=floor(1000*rand());
        b(:,1)=terrain.xx(k);
        b(:,2)=terrain.yy(k)/2;
        set(base4,'Vertices',3*(a-0.5)+b);
        %And now the spaceship        
        titan=draw_spaceship(titan);
        axis([0,40,0,20])
        axis off
        %If it is the first time, we need to display the text
        if firsttime==1
            %If it is the first run, then we need to show the text.
            firsttime=0;
            text(1,15.5,'Moon Lander','color','b','FontSize',49);
            text(1,16,'Moon Lander','color','y','FontSize',50);
            text(1,14,'Press Any key to Start','color','w','FontSize',30);
            text(1,12,'Space = Fire < = rotate left > = Rotate right','color',[0.2,0.2,0.2],'FontSize',10);
            waitforbuttonpress;            
        end    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
if titan.crash==0
    %If the spaceship is not crashed, this updates the spacehip position
    titan=update_spaceship(titan);
    if titan.win==1        
        title('Perfect Landing!','color','b')
        again=1;
        score=score+100;
        pause(1);
    else
        title(['FUEL:  ',num2str(titan.fuel),'  x-velocity: ',num2str((round(titan.vx*100))/100),' y-velocity: ',num2str((round(titan.vy*100))/100),'     SCORE: ',num2str(score)],'color','w');        
    end
else    
    score=score-10;
    title('You kill the crew captain','color','r')
    again=1;
    pause(1);
end
end

function keypress(varargin)
%This is the controls setup.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
global titan
key = get(gcbf,'CurrentKey');
if strcmp(key,'')
elseif strcmp(key,'shift')
elseif strcmp(key,'space')
    titan.fire=1;
elseif strcmp(key,'leftarrow')
    titan.angle=titan.angle+pi/16;
elseif strcmp(key,'uparrow')
elseif strcmp(key,'rightarrow')
    titan.angle=titan.angle-pi/16;
elseif strcmp(key,'downarrow')
elseif strcmp(key,'return')   
end;
end

function keyrelease(varargin)
%This is the controls setup.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
global titan
key = get(gcbf,'CurrentKey');
if strcmp(key,'')
elseif strcmp(key,'shift')
elseif strcmp(key,'space')
    titan.fire=0;
elseif strcmp(key,'leftarrow')    
elseif strcmp(key,'uparrow')
elseif strcmp(key,'rightarrow')  
elseif strcmp(key,'downarrow')
elseif strcmp(key,'return')   
end
end

function check()
%This function checks if we crash the spaceship or if we win.
global titan  terrain again
i=min(find(min(( terrain.xx-titan.x).^2)==(terrain.xx-titan.x).^2));
%This checks if we hit the surface or the boundaries.
if terrain.yy(i)>titan.y || titan.x<0 ||titan.x>80
    titan.crash=1; 
    again=1; 
end
%This checks if we land on the correct place
if ((titan.x-terrain.wx)^2+(titan.y-terrain.wy)^2)<2
    titan.win=1;   
    titan.angle=0;
    again=1;
end
end

function engine_sound()
%This is to generate the sound of the enegine when it fires.
cf = 100;                  % carrier frequency (Hz)
sf = 22050;                 % sample frequency (Hz)
d = 0.1;                    % duration (s)
n = sf * d;                 % number of samples
s = (1:n) / sf;             % sound data preparation
s = sin(2 * pi * cf * s).*cos(cf*s)+0.01*rand(1,n).*cos(4*cf*s);  %Some strange noise
sound(s, sf);               % sound presentation
end