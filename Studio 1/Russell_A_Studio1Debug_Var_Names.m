% Run this script to learn how to debug variable name errors.
clc
clear
Oranges = 8;
apples = 6;
Limes = 3;
Pineapple = 2;
Un_Annanas = 1 * Pineapple;
TresNaranjas = 3 * Oranges;
Zwei_Apfels = 2 * apples;
Quatre_Limes = 4 * Limes;
Fruit = Oranges + apples;
Mixed_Fruit = Oranges + apples + Limes;
Foreign_Fruit = TresNaranjas + Quatre_Limes + Zwei_Apfels + Un_Annanas;
disp(Foreign_Fruit)
disp(Fruit)