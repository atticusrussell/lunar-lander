clc
clear
scr=get(0,'ScreenSize');

f=figure;
f.MenuBar='none';
f.Color='w';
f.Position=[scr(3)/4 scr(4)/4 scr(3)/2 scr(4)/2];
axs=20;
axis([-axs axs -axs axs]);
ax=gca;
ax.Visible='off';

polyd=[-1,0,1,1,-1;1,2,1,-1,-1];
poly=patch(polyd(1,:),polyd(2,:),'r');

n=1;
for n=1:101
    set(poly,'XData',polyd(1,:)+15,'YData',polyd(2,:)+15);
    poly.FaceColor='yellow';
    pause(0.2)
    set(poly,'XData',polyd(1,:)+15,'YData',polyd(2,:)-15);
    poly.FaceColor='green';
    ax.Color='r';
    pause(0.2)
    set(poly,'XData',polyd(1,:)-15,'YData',polyd(2,:)-15);
    poly.FaceColor='cyan';
    pause(0.2)
    set(poly,'XData',polyd(1,:)-15,'YData',polyd(2,:)+15);
    poly.FaceColor='magenta';
    pause(0.2)
    set(poly,'XData',polyd(1,:),'YData',polyd(2,:));
    poly.FaceColor='red';
    pause(0.2)
    n=n+1;
end
close all