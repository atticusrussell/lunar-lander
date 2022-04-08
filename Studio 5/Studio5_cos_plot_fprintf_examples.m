%% Cos plot example #1
% The double-percent sign breaks the script into sections.
% Put your cursor in a section and click "Run Section" rather than "Run" to
% run just the section that contains your cursor!

% Plotting cos(x)
clear
clc
x = zeros(1,101);
y = zeros(1,101);
for n = 1:101
    x(n) = (n-1) * (0.04*pi);
    y(n) = cos(x(n));
end
plot(x,y)

%% Cos plot example #2
clear
clc

% Using comet plot to animate plotting cos(x)
x = zeros(1,1001);
y = zeros(1,1001);
for n = 1:1001
    x(n) = (n-1) * (0.004*pi);
    y(n) = cos(x(n));
end
comet(x,y)

%% Cos plot example #3
clear
clc

% Using hold to allow multiple plots in one figure 
% and adding titles/labels/legend
x = zeros(1,101);
y = zeros(1,101);
for n = 1:101
    x(n) = (n-1) * (0.04*pi);
    y(n) = cos(x(n));
    y2(n) = cos(x(n))^2;
end

plot(x,y)
hold on
plot(x,y2)
title('Cos Plots')
xlabel('x-axis')
ylabel('y-axis')
legend('y = cos(x)', 'y = cos(x)^2')
hold off

%% Cos plot example #4
clear
clc

% Using fprintf
x = zeros(1,101);
y = zeros(1,101);
for n = 1:101
    x(n) = -4*pi + (n-1) * (0.08*pi);
    y(n) = cos(x(n));
end

fprintf('     x       y\n')
for n=1:10:101
    fprintf(' %7.3f  %6.3f\n',x(n), y(n))
end
