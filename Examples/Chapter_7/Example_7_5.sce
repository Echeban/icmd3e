// Example 7.5 (can be adapted for Ex. 7.6)
mode(0); clc; funcprot(0);
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix
E1=54000; E2=18000; G12=9000; //MPa
v12=0.25; tt=0.6; tk=2.54; //mm
F1t=1034; F1c=F1t; F2t=31; F2c=138; F6=41;//MPa
orientation=[0,90,90,0];
thickness=[1,1,1,1]*tk;//mm
n=length(orientation);
te = min(tt,tk);
F2tis = 1.12*sqrt(2)*F2t // lamina is thick
F6is = sqrt(2)*F6
Q = buildQ(E1,E2,G12,v12)
A = buildABD(Q,thickness,orientation)
N = [1000;0;0];// N/mm
eps_ = A\N // in laminate cs
sigma = [,]; R1 = []; R2 = [];//initialize in case memory is not cleared 
for k=1:n/2 // symmetric laminate, membrane load, need only n/2 results
    Q_ = rotateQ(Q,orientation(k));//transform lamina->laminate cs
    sigma_ = Q_ * eps_;// in laminate cs
    s = rotateSigma_(sigma_,orientation(k));// transf. laminate->lamina cs
    R1(k) = Macaulay(F1t/s(1)) + Macaulay(-F1c/s(1)); // see Appendix 
    R2(k) = Macaulay(F2tis/s(2)) + Macaulay(-F2c/s(2)); 
    sigma(:,k) = s;
end
sigma, R1, R2
//
// Example 7.8 (append to Ex. 7.5)
R_FPF = R2(2) // smallest R from Ex. 7.5
df = (1-0.999);// d=0.999
E2 = E2 * df; G12 = G12 * df; v12 = v12 * df; //degraded properties
Q = buildQ(E1,E2,G12,v12); //recalculate with degraded properties
A = buildABD(Q,thickness,orientation);
eps_ = A\N; // in laminate cs
for k=1:n/2 // symmetric laminate, membrane load, need only n/2 results
    Q_ = rotateQ(Q,orientation(k));//transform lamina->laminate cs
    sigma_ = Q_ * eps_;// in laminate cs
    s = rotateSigma_(sigma_,orientation(k));// transf. laminate->lamina cs
    R1(k) = Macaulay(F1t/s(1)) + Macaulay(-F1c/s(1)); // see Appendix 
    sigma(:,k) = s;
end
sigma, R1
N_LPF = N * R1(1)
sigma_LPF = sigma(1)*R1(1)

