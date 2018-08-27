// Example 7.6
mode(0); clc; funcprot(0);
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix
E1=45000; E2=12000; G12=5500; //MPa E-glass/Epoxy Table 1.1
v12=0.19; tt=0.6; tk=0.1; //mm
F1t=1020; F1c=620; F2t=40; F2c=140; F6=60;//MPa Table 1.1
orientation=[0,90,90,0];
thickness=[3,4,4,3]*tk;//mm
n=length(orientation);
te = min(tt,8*tk);//center => thick
te = min(tt,6*tk);//surface => thick
F2tis = 1.12*sqrt(2)*F2t //laminas are thick 
F6is = sqrt(2)*F6
Q = buildQ(E1,E2,G12,v12)
A = buildABD(Q,thickness,orientation)
N = [1;0;0];// N/mm
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
// recalculate
N = [194.7;0;0];// N/mm
eps_ = A\N // in laminate cs
for k=1:n/2 // symmetric laminate, membrane load, need only n/2 results
    Q_ = rotateQ(Q,orientation(k));//transform lamina->laminate cs
    sigma_ = Q_ * eps_;// in laminate cs
    s = rotateSigma_(sigma_,orientation(k));// transf. laminate->lamina cs
    R1(k) = Macaulay(F1t/s(1)) + Macaulay(-F1c/s(1)); // see Appendix 
    R2(k) = Macaulay(F2tis/s(2)) + Macaulay(-F2c/s(2)); 
    sigma(:,k) = s;
end
sigma, R1, R2



