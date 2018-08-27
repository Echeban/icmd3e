// Example 6.3 [0/90/45/-45]_r
clc; mode(0); funcprot(0);
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
a = 1600 // mm
b = 800 // mm
t = 16 // mm
q = 0.02 // MPa
// E-glass/Epoxy [MPa]
E1 = 45000; E2 = 12000; G12 = 5500; // MPa
v12 = 0.19; v23 = 0.31;
// r = 1
tk = 2; // mm
orientation = [0,90,45,-45,-45,45,90,0];
thickness = ones(1,8)*tk;
// r = 2
tk = 1; // mm
orientation = [0,90,45,-45,0,90,45,-45,-45,45,90,0,-45,45,90,0];
thickness = ones(1,16)*tk;
// r = 4
tk = 0.5; // mm
orientation = [0,90,45,-45, 0,90,45,-45, 0,90,45,-45, 0,90,45,-45,...
                -45,45,90,0, -45,45,90,0, -45,45,90,0, -45,45,90,0];
thickness = ones(1,32)*tk;
N = length(orientation)
LT = sum(thickness)
Q = buildQ(E1,E2,G12,v12);
[A,B,D] = buildABD(Q,thickness,orientation);
disp('D [x10^6 MPa mm^3]'); disp(D*1E-6) // x10^6 MPa mm^3
// isotropic equivalent
v = D(1,2)/D(2,2) // laminate Poisson's ratio
E = 12*(1-v^2)/LT^3 * ( D(1,1) + D(2,2) ) / 2
wmax = - 0.1110 * q * b^4 / (E * t^3)
