% MECE-117 Intro Comp Prog for Eng
% J. Torrellas
%Studio Week 3, Activity 4 (While Loops)

summ=0;
newterm=1;
thresh=.5;
k=1;
while newterm>thresh
    newterm=((-1^(k-1))/k);
    summ=summ+newterm;
    k=k+1;
end
    