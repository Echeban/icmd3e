// Example 5.7
mode(0);clc;clear; //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci

//Kevlar-49
Ef=131E3;//MPa
vf=0.35;
//HTP-1072
Em=3.383E3;//MPa
vm = 0.38;

Vf=0.5;
Vm = 1-Vf;

// note ROM() uses diffrent eqns. than Ex. 5.7
[E1,E2,G12,v12,alpha1,alpha2] = ROM(Ef,vf,0,Em,vm,0,Vf)

Q = buildQ(E1,E2,G12,v12)
Q_45 = transf(-45)*Q*transf(-45)'
Q_m45 = transf(45)*Q*transf(45)'

Q_fabric = 300/600*Q_45 + 300/600*Q_m45

//prettyprint(round(E1))
//prettyprint(round(E2))
//prettyprint(round(G12))
//prettyprint(round(Q))
//prettyprint(round(Q_45))
//prettyprint(round(Q_m45))
//prettyprint(round(Q_fabric))

