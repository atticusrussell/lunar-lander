%Atticus Russell
%4/4/2019
%studio 11
%Problem 2 - Integrate test data

clc
clear

%load stress and strain data from file
load Stress_Strain_Data.mat

%set given

%Cross-section area
A0=0.0313; %in^2

%Initial length
L0=2.000; %in


tensile_toughness=trapz(Strain/100,Stress/100);

fprintf('The tensile toughness is  %.4d inch pounds per cubic inch \n',tensile_toughness)



%oops I dont think I needed the functions below




%function to calculate stress
function[stress]=stresscalc(F,A0)
stress=F/A0;
end

%function to calculate strain
function[strain]=straincalc(L)
strain=(L-L0)/L0*100;
end
