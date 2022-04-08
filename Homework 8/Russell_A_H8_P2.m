%Atticus Russell
%3/21/2019
%MECE-117
%Homework 8 Problem 2
clc
clear

%Create a 4x4 matrix A of randomized integers from 1-100
A=[ceil(rand*100),ceil(rand*100),ceil(rand*100),ceil(rand*100);...
    ceil(rand*100),ceil(rand*100),ceil(rand*100),ceil(rand*100);...
    ceil(rand*100),ceil(rand*100),ceil(rand*100),ceil(rand*100);...
    ceil(rand*100),ceil(rand*100),ceil(rand*100),ceil(rand*100)];
%print 'A unsorted' to the command window
disp('A unsorted:')
disp(A)
%Make B a 4x4 matrix of ones
B=ones(4,4);

for R=1:4
    for C=1:4
        % Determine size of input array
        [m,n] = size(A);
        % Find single largest element and its location index
        [maxval,I] = max(A(:));
        % Convert location index into row vector containing row & column indices
        [i_row,i_col] = ind2sub(m,I);
        B(R,C) = max(A(:));
        A(i_row,i_col)=-1;
    end
end

disp('A sorted:')
disp(B)