// Example 6.4
clc; mode(0); funcprot(0);
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
a = 1600; // mm
b = 800;
t = 16;
wmax = 9.10; // mm
kappa(1) = (%pi/a)^2 * wmax;
kappa(2) = (%pi/b)^2 * wmax;
kappa(3) = 0
// @ bottom z=-t/2
eps_ = t/2 * kappa // laminate c.s.
// E-glass/Epoxy [MPa]
E1 = 45000; E2 = 12000; G12 = 5500; v12 = 0.19; v23 = 0.31;
tk = 0.5 // mm
orientation = [0,90,45,-45, 0,90,45,-45, 0,90,45,-45, 0,90,45,-45,...
               -45,45,90,0, -45,45,90,0, -45,45,90,0, -45,45,90,0];
thickness = ones(1,32)*tk;
N = length(orientation)
LT = sum(thickness)
Q = buildQ(E1,E2,G12,v12)
sigma_ = Q * eps_
