%how to do graphics in matlab
%create and animate a spaceship using the patch and set function

scrsize=get(0,'ScreenSize');
    
  

%create a figure window 
% set bottom-left corner location [50,10] units=pixels
% set width & height [600,600]
 fig1=figure('Position',[50,10,600,600]);
 %define axis limits
 xmax=150;
 xmin=-xmax;
 ymax=xmax;
 ymin=xmin;
 %Create axis with equal aspect ratio, turn off auto-scaling & turn off
 %display of axis
 axis([xmin xmax ymin ymax])
 axis equal 
 axis manual
 axis off
 %Create 'patch' for spaceship
 %Coordinates of polygon defining spaceship shape
 SHIP=[0.00,1.00,4.00,1.00,0.00,-1.00,-4.00,-1.00;
      -2.50,-0.75,-1.50,1.50,5.00,1.50,-1.50,-0.75];
%Scale ship to make it more visible
  SHIPscale = 2;
SHIP = SHIPscale*SHIP;
%Create patch, move it to point (Xs,Ys) & color it blue
Xs=35;
Ys=35;

Shp_Patch = patch(SHIP(1,:)+Xs,SHIP(2,:)+Ys,'b');
%Variable Shp_Patch contains the 'handle' to the patch
%create a for loop to calculate Xs & Ys as functions of theta & r_orbit
    %within the for loop, use the set function to relocate Shp_Patch for
    %each value of theta

     r_orbit=100;
     theta=0:(pi/180):8*pi;
     z=length(theta);
    
     for n=1:z
         X=r_orbit*cos(theta(n));
         Y=r_orbit*sin(theta(n));
     %use set to create new ship position
     %set(Shp_Patch,'XData',SHIP(1,:)+X,'YData',SHIP(2,:)+Y);
    % pause(0.05);
     
     RtnMtrx=[cos(-theta(n)) sin(-theta(n));-sin(-theta(n)) cos(-theta(n))];
     SHIP2=RtnMtrx*SHIP;
     set(Shp_Patch,'XData',SHIP2(1,:)+X,'YData',SHIP2(2,:)+Y)
     pause(.000001);
     end
     
  
   
       
