% ICMD Ex. 6.8
clc
theta=55
m=cosd(theta)
n=sind(theta)
T=[[m^2 n^2 2*m*n];[n^2 m^2 -2*m*n];[-m*n m*n m^2-n^2]]
T1=T^-1
T1=[[m^2 n^2 -2*m*n];[n^2 m^2 2*m*n];[m*n -m*n m^2-n^2]]

% s=[337.1 671.4 291.4]'
% sp=T*s

theta=-55
m=cosd(theta)
n=sind(theta)
T1=[[m^2 n^2 -2*m*n];[n^2 m^2 2*m*n];[m*n -m*n m^2-n^2]]
s=[337.1 671.4 291.4]'
sp=T1*s

