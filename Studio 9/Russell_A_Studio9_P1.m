%Atticus Russell
%3/21/19
%MECE 117
%Studio 9 Problem 1
clc
clear

%% A. 
clc
clear
%convert equations to Ax=b form
A=[-2,1; -2,1]
b=[-5;3]

% Try Matrix Inversion
%x=Ainv*b
%check to see if A can be inverted 
if det(A)==0
    %Matrix is singular - can't be inverted
    disp('ERROR - Singular matrix A cannot be inverted')
else
    %find solution
    Ainv=inv(A)
    disp('Solution is:')
    x=Ainv*b
end

%Try left-division (Gause-Jordan elimination)
%Create augmented matrix Ab
Ab=[A,b]
%calculate rank and the # of unknows
%rank is fancy speak for the number of independent equations
rA=rank(A)
rAb=rank(Ab)
[eqnA,unkA]=size(A)
%Check for solvability
if rA==rAb
    %sytem can be solved
    if  rA==unkA
        %Solution is unique
        disp('Unique solution exists:')
        x=A\b
    else
        %solution is not unique
        disp('Solution is not unique.')
        %calculate reduced row echelon colution
        disp('Solution set defined by Cx=d.')
        Cd=rref(Ab)
    end
else
    %no solution
    disp('ERROR - System cannot be solved.') 
end
   
%% B.
clc
clear
%convert equations to Ax=b form
A=[-2,1; -8,4]
b=[3;12]

% Try Matrix Inversion
%x=Ainv*b
%check to see if A can be inverted 
if det(A)==0
    %Matrix is singular - can't be inverted
    disp('ERROR - Singular matrix A cannot be inverted')
else
    %find solution
    Ainv=inv(A)
    disp('Solution is:')
    x=Ainv*b
end

%Try left-division (Gause-Jordan elimination)
%Create augmented matrix Ab
Ab=[A,b]
%calculate rank and the # of unknows
%rank is fancy speak for the number of independent equations
rA=rank(A)
rAb=rank(Ab)
[eqnA,unkA]=size(A)
%Check for solvability
if rA==rAb
    %sytem can be solved
    if  rA==unkA
        %Solution is unique
        disp('Unique solution exists:')
        x=A\b
    else
        %solution is not unique
        disp('Solution is not unique.')
        %calculate reduced row echelon colution
        disp('Solution set defined by Cx=d.')
        Cd=rref(Ab)
    end
else
    %no solution
    disp('ERROR - System cannot be solved.') 
end
%% C.
clc
clear
%convert equations to Ax=b form
A=[-2,1; -2,1]
b=[-5;-5.00001]

% Try Matrix Inversion
%x=Ainv*b
%check to see if A can be inverted 
if det(A)==0
    %Matrix is singular - can't be inverted
    disp('ERROR - Singular matrix A cannot be inverted')
else
    %find solution
    Ainv=inv(A)
    disp('Solution is:')
    x=Ainv*b
end

%Try left-division (Gause-Jordan elimination)
%Create augmented matrix Ab
Ab=[A,b]
%calculate rank and the # of unknows
%rank is fancy speak for the number of independent equations
rA=rank(A)
rAb=rank(Ab)
[eqnA,unkA]=size(A)
%Check for solvability
if rA==rAb
    %sytem can be solved
    if  rA==unkA
        %Solution is unique
        disp('Unique solution exists:')
        x=A\b
    else
        %solution is not unique
        disp('Solution is not unique.')
        %calculate reduced row echelon colution
        disp('Solution set defined by Cx=d.')
        Cd=rref(Ab)
    end
else
    %no solution
    disp('ERROR - System cannot be solved.') 
end
%% D.
clc
clear
%convert equations to Ax=b form
A=[1,5,-1,6;2,-1,1,-2;-1,4,-1,3;3,-7,-2,1]
b=[19;7;30;-75]

% Try Matrix Inversion
%x=Ainv*b
%check to see if A can be inverted 
if det(A)==0
    %Matrix is singular - can't be inverted
    disp('ERROR - Singular matrix A cannot be inverted')
else
    %find solution
    Ainv=inv(A)
    disp('Solution is:')
    x=Ainv*b
end

%Try left-division (Gause-Jordan elimination)
%Create augmented matrix Ab
Ab=[A,b]
%calculate rank and the # of unknows
%rank is fancy speak for the number of independent equations
rA=rank(A)
rAb=rank(Ab)
[eqnA,unkA]=size(A)
%Check for solvability
if rA==rAb
    %sytem can be solved
    if  rA==unkA
        %Solution is unique
        disp('Unique solution exists:')
        x=A\b
    else
        %solution is not unique
        disp('Solution is not unique.')
        %calculate reduced row echelon colution
        disp('Solution set defined by Cx=d.')
        Cd=rref(Ab)
    end
else
    %no solution
    disp('ERROR - System cannot be solved.') 
end

