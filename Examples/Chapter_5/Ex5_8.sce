// Example 5.8
mode(0);clc;clear; //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci

//E-glass
Ef = 72.35E3;//MPa
vf = 0.22;
//HTP-1072
Em = 3.383E3;//MPa
vm = 0.38;

Vf = 0.5;
Vm = 1-Vf;

// unidirectional: note ROM() uses diffrent eqns. than Ex. 5.7
[E1,E2,G12,v12,alpha1,alpha2] = ROM(Ef,vf,0,Em,vm,0,Vf)
// CSM
E = 3/8*E1+5/8*E2
G = 1/8*E1+1/4*E2
v = E/(2*G) - 1

Q_uni = buildQ(E1,E2,G12,v12)
Q_csm = buildQ(E,E,G,v)
Q_45 = transf(-45)*Q_uni*transf(-45)'
Q_m45 = transf(45)*Q_uni*transf(45)'

Q_fabric = 400/1025*(Q_45 + Q_m45) + 225/1025*Q_csm

//prettyprint(round(Q_uni))
//prettyprint(round(Q_csm))
//prettyprint(round(Q_45))
//prettyprint(round(Q_m45))
//prettyprint(round(Q_fabric))
