// Example 5.1, 5.2, 5.6
clc; mode(0); //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci
// data
E1 = 19981; //MPa
E2 = 11389;
G12 = 3789;
v12 = 0.274;
v23 = 0.385;
// calculate
Q = buildQ(E1,E2,G12,v12);
G23 = E2/2/(1+v23);
G13 = G12;
Qast = [[G23,0];[0,G13]];

// Example 5.2 in GPa^-1
S = 1000*inv(Q)

// Example 5.6
theta = -55;
// from Example 5.1
Q;
Tinv = transf(-theta);
Q_ = Tinv*Q*Tinv';
