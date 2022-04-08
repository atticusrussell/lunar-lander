clc
clear
x = linspace(0,pi,20);
y = myfun(x);
slope = cendiff(x,y);
plot(x,y,'ro-',x,slope,'bs--')


function[fx]= myfun(x)
fx = 3*cos(x).^2 - sin(2*x);
end

function[dfdx]= cendiff(x,y)
    lenx = length(x);
    dfdx = NaN(lenx);
    n=2;
    for n = 2:(lenx-1)
        dfdx(n) = y(n+1) - y(n-1) / (x(n+1) - x(n-1));
        n=n+1;
    end
end 

