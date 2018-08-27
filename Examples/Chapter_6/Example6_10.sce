// Example 6.10 Pressure Vessel
mode(0); clc; funcprot(0); 
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
d = 330 // mm
p = 20.67 // MPa
COV = 0.2 //
phi = 1/3.5 // resistance factor
// material [MPa]
Vf = 0.55 // fiber volume fraction
Ef= 72345; vf = 0.22; // fiber
Em = 2495; vm = 0.38; // matrix
Fft = 1378 // average fiber tensile strength [MPa]
tk = 1.27 // mm
// LSS
thickness = ones(1,4)*tk
orientation = [55,-55,-55,55]
// load
Nx = p*d/4
Ny = p*d/2
N = [Nx Ny 0]'; // assemble membrane load as column array
// lamina properties 
E1 = Ef*Vf + Em*(1-Vf)
// Halpin-Tsai
eta = ((Ef/Em)-1)/((Ef/Em)+2)
E2 = Em * (1+2*eta*Vf)/(1-eta*Vf)
// Cylindrical assemblage
Gf = Ef/2/(1+vf)
Gm = Em/2/(1+vm)
G12 = Gm * ((1+Vf)+(1-Vf)*Gm/Gf) / ((1-Vf)+(1+Vf)*Gm/Gf)
v12 = vf*Vf + vm*(1-Vf)
// lamina strength
F1t = Fft * (Vf + Em/Ef*(1-Vf))
// lamina [Q]
v23 = 0.5; // assumed
Q = buildQ(E1,E2,G12,v12)
NL = length(orientation)
A = buildABD(Q,thickness,orientation)
eps0 = A\N // membrane strain
// lamina k=1, underscore means laminate c.s.
Q_ = rotateQ(Q,orientation(1))
sigma_ = Q_ * eps0 // stress in laminate c.s
sigma = rotateSigma_(sigma_,orientation(1)) // laminate --> lamina c.s
alpha = 1.465 // load factor for reliability 99%
// max. stress criterion
R1 = (phi*F1t)/(alpha*sigma(1))
td = 4*tk/R1 // design

