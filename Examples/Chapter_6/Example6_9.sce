// Example 6.9
mode(0); clc; funcprot(0); clear;
exec('C:/Users/EJB/OneDrive/Scilab/CLT.sci',0);//include CLT.sci
// from Example 5.1 [MPa]
E1 = 19981; E2 = 11389; G12 = 3789; v12 = 0.274; v23 = 0.385;
// compute [Q] for one lamina
Q = buildQ(E1,E2,G12,v12);
// CTE data
alpha(1) = 8.42E-6; alpha(2) = 29.8E-6; alpha(3) = 0;
// use negative of actual angle bec. rotateEps_ does laminate --> lamina
alpha_ = rotateEps_(alpha,-55)' // for 55 (transform lamina --> laminate c.s.)
alpha_ = rotateEps_(alpha,55)' // for -55
DeltaT = -100; // C
tk = 0.635; // mm
thickness = [1,1]*tk; // mm
orientation = [55,-55]; // degrees
NL = length(orientation); LT = sum(thickness);
NT = 0; MT = 0; // initialize thermal loads
// calculate thermal loads
zk = -LT/2; // bottom of laminate 
for k=1:NL // loop over laminas
    zk_ = zk + tk/2; // mid-surface of lamina k
    Q_ = rotateQ(Q,orientation(k)); // lamina --> laminate c.s.
    NT = NT + Q_ * rotateEps_(alpha,-orientation(k)) * tk; 
    MT = MT - Q_ * rotateEps_(alpha,-orientation(k)) * tk * zk_; 
    zk = zk + tk; // increment zk for next step 
end
NT = NT * DeltaT
MT = MT * DeltaT
// thermal strains and curvatures
[A,B,D] = buildABD(Q,thickness,orientation);
NM = [NT' MT']'; // assemble as a column array 
ABD = [[A B];[B' D]]; // assemble 6x6 matrix
epskappa = ABD\NM; // calculate 6x1 column of strains and curvatures
eps0 = epskappa(1:3) // extract membrane strains
kappa = epskappa(4:6) // extract curvatures
// calculate strains and stresses through thickness z
kk = 0; zk = -LT/2; // bottom of laminate 
for k=1:NL // loop over laminas
    Q_ = rotateQ(Q, orientation(k)); // lamina --> laminate
    alpha_ = rotateEps_(alpha,-orientation(k)); // lamina --> laminate
    // bottom of lamina k
    kk = kk+1; // counter for tables
    eps_ = (eps0 - zk * kappa); // strain at z=zk
    table_strain(kk,:) = [zk eps_']; // store for display
    sigma_ = Q_ * (eps_ - alpha_ * DeltaT); // stress at z=zk
    table_stress(kk,:) = [zk sigma_']; // store for display
    // top of lamina k
    zk = zk + tk; // top of current lamina == bottom of next one
    kk = kk+1; // counter for tables
    eps_ = (eps0 - zk * kappa);
    table_strain(kk,:) = [zk eps_'];
    sigma_ = Q_ * (eps_ - alpha_ * DeltaT); 
    table_stress(kk,:) = [zk sigma_'];
end
table_strain
table_stress
