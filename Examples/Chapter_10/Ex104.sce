// Ex 10.4
clc;clear;mode(0); funcprot(0); 
format(7); // displays 4 decimal places
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0);
b = 9; tk = 3; L = 54; // dimensions [mm]
P = 1000; // Newtons
E1 = 76E3; E2 = 5.56E3; G12 = 2.3E3; //MPa, Kevlar/epoxy
v12 = 0.34; 

Q = buildQ(E1,E2,G12,v12)
orientation = [45,-45,0];// specify LSS
thickness = [1,1,1]*tk;
NL = length(orientation)
LT = sum(thickness)
[A,B,D] = buildABD(Q,thickness,orientation)
ABD = [[A,B];[B',D]] // asemble A,B,D into 6x6 matrix ABD
// from here on, everything times 1E6 for better display !!!
S = inv(ABD) * 1E6 // compliance, times 10^-6
prettyprint(S) // LaTeX output
s = [ [S(1,1), S(1,4), 0, 0]; [S(4,1), S(4,4), 0, 0]; ...
      [0, 0, S(3,3), S(3,6)]; [0, 0, S(6,3), S(6,6)] ]//reduced compliance
prettyprint(s) // LaTeX output
abd = inv(s)
A = abd(1:1)// redefining variables
B = abd(1,2)
D = abd(2,2)
F = abd(3,3)
C = abd(3,4)
H = abd(4,4)
eb = B/A
EIsp = (D-eb^2*A)*b
EIrp = (A*b^3)/12
delta = (P*L^3)/(3*EIsp) * 1E-6 // * E-6 to go back to actual units

