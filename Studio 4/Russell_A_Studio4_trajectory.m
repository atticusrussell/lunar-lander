


%Atticus Russell
prompt=('input initial velocity v0 ');
v0=input(prompt);

prompt=('input theta in degrees');
theta=input(prompt);

y=0;
x=0;
g=9.81;
t=0;
dt=0.1;
n=0;

while y>=0
      n=n+1
      t=t+dt;
      x(n)=v0*cosd(theta)*t
      y(n)=v0*sind(theta)*t-0.5*g*t^2
end

plot(x,y)


