// Example 4.5. Calculate CTEs
mode(0);clear;clc;
exec('C:\Users\zorza\OneDrive\Scilab\CLT.sci');// load CLT functions

Polyester.E = 3.4E3;// MPa. Isophtalic Polyester
Polyester.nu = 0.38;
Polyester.alpha = 30;// ppm/C 

Eglass.E = 72.35E3;// MPa
Eglass.nu = 0.22;//dimensionless
Eglass.alpha = 5.4;// ppm/C
Sglass.E = 85.0E3;
Sglass.nu = 0.22;
Sglass.alpha = 2.9;
Kevlar49.E = 131E3;
Kevlar49.nu = 0.35;
Kevlar49.alpha = -2;
T300.E = 230E3;
T300.nu = 0.2;
T300.alpha = -0.6;

Vf = 0.55;
Vm = 1-Vf;

EM = Polyester.E;
vM = Polyester.nu;
alphaM = Polyester.alpha;

EA = Sglass.E;
vA = Sglass.nu;
alphaA = Sglass.alpha;
alphaT = alphaA;// isotropic
ET = EA;// isotropic
vT = vA;//isotropic
GA = EA/2/(1+vT);// Transversely isotropic 

[E1,E2,G12,v12,v23,alpha1,alpha2] = PMM(EA,ET,GA,vA,vT,EM,vM,alphaA,alphaT,alphaM,Vf)
