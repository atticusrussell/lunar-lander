%Atticus Russell
%4/4/2019
%studio 11
%Problem 1
%integrate from 0 to pi sinx dx =2 use trapezoid rule and integrate with 
%varying numbers of segments to 15 decimal places. Check work with trapz

clc
clear 

%calculate the integral of sin with built in matlab integral
realint=integral(@sin,0,pi);


%plug the number of segment in the integral into the function with various
%numbers of segments 
int3=trapezoid(3);
int4=trapezoid(4);
int5=trapezoid(5);
int6=trapezoid(6);
int7=trapezoid(7);
int8=trapezoid(8);
int9=trapezoid(9);
int10=trapezoid(10);
int11=trapezoid(11);
int12=trapezoid(12);
int13=trapezoid(13);
int14=trapezoid(14);
int15=trapezoid(15);
int16=trapezoid(16);
int17=trapezoid(17);
int18=trapezoid(18);
int19=trapezoid(19);
int20=trapezoid(20);
int100=trapezoid(100);
int1000=trapezoid(1000);
int10000=trapezoid(10000);
int100000=trapezoid(100000);
int1000000=trapezoid(1000000);


%calculate errors from built in and approximation and percentages
diff3=realint - int3;
perc3=(diff3/realint)*100;

diff4=realint - int4;
perc4=(diff4/realint)*100;

diff5=realint - int5;
perc5=(diff5/realint)*100;

diff6=realint - int6;
perc6=(diff6/realint)*100;

diff7=realint - int7;
perc7=(diff7/realint)*100;

diff8=realint - int8;
perc8=(diff8/realint)*100;

diff9=realint - int9;
perc9=(diff9/realint)*100;

diff10=realint - int10;
perc10=(diff10/realint)*100;

diff11=realint - int11;
perc11=(diff11/realint)*100;

diff12=realint - int12;
perc12=(diff12/realint)*100;

diff13=realint - int13;
perc13=(diff13/realint)*100;

diff14=realint - int14;
perc14=(diff14/realint)*100;

diff15=realint - int15;
perc15=(diff15/realint)*100;

diff16=realint - int16;
perc16=(diff16/realint)*100;

diff17=realint - int17;
perc17=(diff17/realint)*100;

diff18=realint - int18;
perc18=(diff18/realint)*100;

diff19=realint - int19;
perc19=(diff19/realint)*100;

diff20=realint - int20;
perc20=(diff20/realint)*100;

diff100=realint - int100;
perc100=(diff100/realint)*100;

diff1000=realint - int1000;
perc1000=(diff1000/realint)*100;

diff10000=realint - int10000;
perc10000=(diff10000/realint)*100;

diff100000=realint - int100000;
perc100000=(diff100000/realint)*100;

diff1000000=realint - int1000000;
perc1000000=(diff1000000/realint)*100;


%display stuff 
fprintf('the integral of sin using the trapezoid rule and 3 segments is %.15f \n',int3)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff3,perc3)

fprintf('the integral of sin using the trapezoid rule and 4 segments is %.15f \n',int4)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff4,perc4)

fprintf('the integral of sin using the trapezoid rule and 5 segments is %.15f \n',int5)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff5,perc5)

fprintf('the integral of sin using the trapezoid rule and 6 segments is %.15f \n',int6)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff6,perc6)

fprintf('the integral of sin using the trapezoid rule and 7 segments is %.15f \n',int7)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff7,perc7)

fprintf('the integral of sin using the trapezoid rule and 8 segments is %.15f \n',int8)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff8,perc8)

fprintf('the integral of sin using the trapezoid rule and 9 segments is %.15f \n',int9)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff9,perc9)

fprintf('the integral of sin using the trapezoid rule and 10 segments is %.15f \n',int10)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff10,perc10)

fprintf('the integral of sin using the trapezoid rule and 11 segments is %.15f \n',int11)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff11,perc11)

fprintf('the integral of sin using the trapezoid rule and 12 segments is %.15f \n',int12)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff12,perc12)

fprintf('the integral of sin using the trapezoid rule and 13 segments is %.15f \n',int13)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff13,perc13)

fprintf('the integral of sin using the trapezoid rule and 14 segments is %.15f \n',int14)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff14,perc14)

fprintf('the integral of sin using the trapezoid rule and 15 segments is %.15f \n',int15)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff15,perc15)

fprintf('the integral of sin using the trapezoid rule and 16 segments is %.15f \n',int16)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff16,perc16)

fprintf('the integral of sin using the trapezoid rule and 17 segments is %.15f \n',int17)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff17,perc17)

fprintf('the integral of sin using the trapezoid rule and 18 segments is %.15f \n',int18)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff18,perc18)

fprintf('the integral of sin using the trapezoid rule and 19 segments is %.15f \n',int19)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff19,perc19)

fprintf('the integral of sin using the trapezoid rule and 20 segments is %.15f \n',int20)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff20,perc20)

fprintf('the integral of sin using the trapezoid rule and 100 segments is %.15f \n',int100)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff100,perc100)

fprintf('the integral of sin using the trapezoid rule and 1000 segments is %.15f \n',int1000)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff1000,perc1000)

fprintf('the integral of sin using the trapezoid rule and 10000 segments is %.15f \n',int10000)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff10000,perc10000)

fprintf('the integral of sin using the trapezoid rule and 100000 segments is %.15f \n',int100000)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff100000,perc100000)

fprintf('the integral of sin using the trapezoid rule and 1000000 segments is %.15f \n',int1000000)
fprintf('the error is %.15f, which is %.15f%% \n\n',diff1000000,perc1000000)


%the function for evaluating the integral for sin with n segments using the
%trapezoid rule
function[integral]=trapezoid(n)

x = linspace(0,pi,n);
dx = x(2) - x(1);
f_x = sin(x);
trapint = (sum(f_x) - (f_x(1) + f_x(end))/2)*dx;


integral=(sum(f_x)-(f_x(1)+f_x(end))/2)*dx;
end






