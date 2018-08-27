// Example 1.7 Scilab
//[P,Q]=cdfnor("PQ",X,Mean,Std)
//X=cdfnor("X",Mean,Std,P,Q)
//Mean=cdfnor("Mean",Std,P,Q,X)
//Std=cdfnor("Std",P,Q,X,Mean)
mode(0);format(7);
Q = 0.95
muF = 65.5;//MPa
vF  = 14.47;//MPa
//
COV = vF/muF
P = 1-Q
z = cdfnor("X",0,1,P,Q)
phi = 1 + z * COV
fp = phi * muF 
fp = cdfnor("X",muF,vF,P,Q)
