classdef spaceship
    %This is a classdef to use with Moon03 game.
    properties
        x
        y
        vx
        vy
        angle
        fire
        fuel
        physics
        win
        crash
        mainspritefaces
        mainspriteverts
        mainspritecdata
        firefaces
        fireverts
        firecdata 
        drawing
        drawing_fire
    end
    methods
        function obj =spaceship(varargin)
            %Create the player's spaceship. The object gamedata.mat is
            %previously generated sprites.
            load('gamedata.mat')            
            obj.x=10;
            obj.y=18;
            %Velocity
            obj.vx=0;
            obj.vy=0;
            %Rotation
            obj.angle=0;
            %Engine on/off
            obj.fire=0;
            %Fuel
            obj.fuel=200;
            %These are related to the win/lose state of the game.           
            obj.win=0;
            obj.crash=0;
            %These are for drawing
            obj.mainspritefaces=spaceshipfaces;
            obj.mainspriteverts=spaceshipverts-0.5;
            obj.mainspritecdata=spaceshipcdata;
            obj.firefaces=spaceship_firefaces;
            obj.fireverts=spaceship_fireverts-0.5;
            obj.firecdata=spaceship_firecdata;
        end
        function obj=draw_spaceship(obj)
            %Spaceship is draw as a patch object.            
            obj.drawing= patch('Faces',obj.mainspritefaces,'Vertices',obj.mainspriteverts,'FaceColor','flat','FaceVertexCData',obj.mainspritecdata,'EdgeColor','none');
            obj.drawing_fire= patch('Faces',obj.firefaces,'Vertices',obj.fireverts,'FaceColor','none','FaceVertexCData',obj.firecdata,'EdgeColor','none');
            obj.angle=0;            
            obj=update_spaceship(obj);
        end
        function obj=update_spaceship(obj)
            %This function moves or rotates the sprite to the position held by the spaceship.               
            %In order to prevent sprite deformation after several
            %transformations, we allways transform vertex from original
            %ones.
            b(:,1)=obj.mainspriteverts(:,1).*cos(obj.angle)-obj.mainspriteverts(:,2).*sin(obj.angle);
            b(:,2)=obj.mainspriteverts(:,1).*sin(obj.angle)+obj.mainspriteverts(:,2).*cos(obj.angle);
            a=get(obj.drawing,'Vertices');
            a(:,1)=obj.x;
            a(:,2)=obj.y;
            set(obj.drawing,'Vertices',b+a);            
            b(:,1)=obj.fireverts(:,1).*cos(obj.angle)-obj.fireverts(:,2).*sin(obj.angle);
            b(:,2)=obj.fireverts(:,1).*sin(obj.angle)+obj.fireverts(:,2).*cos(obj.angle);
            a=get(obj.drawing_fire,'Vertices');
            a(:,1)=obj.x;
            a(:,2)=obj.y;
            set(obj.drawing_fire,'Vertices',b+a);
            %The engine's fire is always drawn, but it is swhon or not.
            if obj.fire==1
                set(obj.drawing_fire,'FaceColor','flat');
            else
                 set(obj.drawing_fire,'FaceColor','none');
            end          
        end       
        function obj=physics_spaceship(obj,dt)
            %This is a basic function to calculate the movement of the spaceship
            %Check if engine has fuel and if engine is on
            if obj.fuel>=0 && obj.fire==1
                obj.fuel=obj.fuel-1;
            else    
                obj.fire=0;
            end
            %First the aceleration due to the engine (massless spaceship).
            ax=-sin(obj.angle)*obj.fire*dt;
            ay=cos(obj.angle)*obj.fire*dt;
            %Then update the velocity.
            g=0.4;
            obj.vx=obj.vx+ax;
            obj.vy=obj.vy+ay-g*dt;
            %Update the position.
            obj.x=obj.x+obj.vx*dt;
            obj.y=obj.y+obj.vy*dt;
        end
    end
end