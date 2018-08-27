// Example 7.7
mode(0); clc; funcprot(0); clear;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix CLT.sci
d = 400; //mm
p = 3; //MPa
E1 = 45000; E2 = 12000; G12 = 5500; //MPa E-glass/Epoxy Table 1.1
v12 = 0.19; tt = 0.6; tk = 0.375;//since 2*tk >= tt, laminas are "thick"
F1t = 1020; F1c = 620; F2t = 40; F2c = 140; F6 = 60;//MPa Table 1.1
Q = 0.95 // Reliability
z = cdfnor("X",0,1,1-Q,Q) // standard variable
COV_p = 0.10 // pressure COV
COV_F = 0.12 // strength COV
alpha = 1 - z * COV_p // load factor
phi = 1 + z * COV_F // resistance factor
N = []; N(1) = alpha*p*d/4;
N(2) = alpha*p*d/2; N(3) = 0
orientation=[55,-55,-55,55];
thickness=[1,1,1,1]*tk;//increase thickness to tk*n here for redesign 
n=length(orientation);
Q = buildQ(E1,E2,G12,v12);
A = buildABD(Q,thickness,orientation);
eps_ = A\N;
for k=1:n/2 // symmetric laminate, membrane load, need only n/2 results
    te = min(tt,2*thickness(k)); // 2X surface lamina and center lamina
    F2tis = 1.12*sqrt(2*tt/te)*F2t //use this below
    F6is = sqrt(2*tt/te)*F6 //use this below
    FT = [F1t;F2tis;F6is]*phi; FC=[F1c;F2c;F6is]*phi;//include phi here
    Q_ = rotateQ(Q,orientation(k)); // transform lamina->laminate cs
    sigma_ = Q_ * eps_; // in laminate cs
    s = rotateSigma_(sigma_,orientation(k));//transf. laminate->lamina cs
    R = maxStress(FT,FC,s)// see Appendix maxStress
end

