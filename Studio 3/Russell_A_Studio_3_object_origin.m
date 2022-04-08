%Atticus Russell
%2/5/2019
%MECE 117 
%Studio 3
%object origin

clc
clear

Tsum = 0;
CritBot = pi-(1*10^(-8));
CritTop = pi+(1*10^(-8));
n = 0;

while (Tsum < CritBot) || (Tsum > CritTop)
    n = n+1;
    Tsum = Tsum + ((4*(-1)^(n+1))/(2*n-1))
end

disp(n) %99995329
disp(Tsum)
    
