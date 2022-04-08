% MECE-117 Intro Comp Prog for Eng
% Studio #4
% Array & Matrix arithmetic
%
% Load 'Studio4_Arrays.mat' before running this script
% Debug this script so that it properly adds arrays A & B
%
clear
clc

load('Studio4_Arrays.mat')

D=zeros(3,5);
for cn=1:5
    for rn=1:3
        D(rn,cn)=A(rn,cn)./B(rn,cn);
    end
end
disp('The quotient D of A / B is:');
disp(D)
