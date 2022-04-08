%Atticus Russell
%3/26/2019
%MECE-117
%Homework 9 Problem 1

%% A.
clear
clc

A = [2, 1; 3, -9];
B = [5; 7];
AB = [A,B];
rA = rank(A);
rAB = rank(AB);

if det(A) == 0
    %Error message
    disp('Error: cannot invert A because matrix is singular')
else 
    %Multiply inverse of A by B
    Ainv = inv(A);
   answer = Ainv*B;
    disp('x is:')
    answer(1)
    disp('y is:')
    answer(2)
end

%% B.
clear
clc

A = [-8, -5; -2, 7];
B = [4; 10];
AB = [A,B];
rA = rank(A);
rAB = rank(AB);

if det(A) == 0
    %Error message
    disp('Error: cannot invert A because matrix is singular')
else 
    %Multiply inverse of A by B
    Ainv = inv(A);
    answer = Ainv*B;
    disp('x is:')
    answer(1)
    disp('y is:')
    answer(2)
end

%% C.
clear
clc

A = [12, -5, 0; -3, 4, 7; 6, 2, 3];
B = [11; -3; 22];
AB = [A,B];
rA = rank(A);
rAB = rank(AB);

if det(A) == 0
    %Error message
    disp('Error: cannot invert A because matrix is singular')
else 
    %Multiply inverse of A by B
    Ainv = inv(A);
    answer = Ainv*B;
    disp('x is:')
    answer(1)
    disp('y is:')
    answer(2)
    disp('x3 is:')
    answer(3)
end

%% D.
clear
clc

A = [6, -3, -4; 12, 5, -7; -5, 2, 6];
B = [41; -26; 16];
AB = [A,B];
rA = rank(A);
rAB = rank(AB);

if det(A) == 0
    %Error message
    disp('Error: cannot invert A because matrix is singular')
else 
    %Multiply inverse of A by B
    Ainv = inv(A);
    answer = Ainv*B;
    disp('x is:')
    answer(1)
    disp('y is:')
    answer(2)
    disp('x3 is:')
    answer(3)
end