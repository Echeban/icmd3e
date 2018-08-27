// Example 6.2
mode(0) //prints everything not suppressed with ;
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
// from Ex. 5.1
E1 = 19981; E2 = 11389; G12 = 3789; v12 = 0.274; v23 = 0.385;
// data
thickness = [0.635];//mm
orientation = [0];//degrees
// calculate
Q = buildQ(E1,E2,G12,v12)
[A,B,D] = buildABD(Q,thickness,orientation);
D,
delta = inv(D)
kappa = delta*{1000,0,0}' // note ' means transposed
z = -0.635/2;
eps = - z * kappa// in laminate coordinates
Q_ = Q; //because theta=0
str = Q_*eps // in laminate coordinates

