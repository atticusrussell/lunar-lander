%Atticus Russell
%2/5/2019
%MECE 117 
%Studio 3
%IF ELSEIF


clear
clc

%Prompt user to input value for x
prompt="In f(x,y), what is the value of x? ";
x=input(prompt);

%Prompt user to input value for y
prompt="In f(x,y), what is the value of y? ";
y=input(prompt);


%use IF and ELSEIF to implement function
if x >= 0 & y >= 0
    f=x*y;
elseif x >= 0 & y < 0
    f=x*y^2;
elseif x < 0 & y >= 0
    f=x^2*y;
elseif x < 0 & y < 0
    f=x^2*y^2;
end


%display f(x,y)
fprintf('f(x,y)= %f \n(',f) 



  
    
    
    
    