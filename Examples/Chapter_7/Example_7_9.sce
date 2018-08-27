// Example 7.9: [0_2/90_2]_S vs. [45/0/90/-45]_S
mode(0); funcprot(0); clc; clear;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix CLT.sci
E1 = 126E3; E2 = 11E3; G12 = 6.6E3; //MPa, AS4/3501-6
v12 = 0.28; tt = 0.8; tk = 0.125; //mm
F1t = 1950; F1c = 1480; F2t = 48; F2c = 200; F6 = 79;//MPa
// starting case
orientation=[0,90,90,0];
thickness=[2,2,2,2]*tk;
// uncomment next 2 lines for redesign
 orientation=[45,0,90,-45,-45,90,0,45];
 thickness=[1,1,1,1,1,1,1,1]*tk;
//
N = [0;0;1];//change sign here to reverse the load
Q = buildQ(E1,E2,G12,v12);
A = buildABD(Q,thickness,orientation);
eps_ = A\N;
n=length(orientation);
for k=1:n/2
    te = min(tt,thickness(k)) // inner laminas
    if (k==1|k==n/2) then // surface and center laminas
        te = min(tt,2*thickness(k)) // double thickness
    end
    F2tis = 1.12*sqrt(2*tt/te)*F2t 
    F6is = sqrt(2*tt/te)*F6 
    FT = [F1t;F2t;F6]; FC=[F1c;F2c;F6];// without in-situ correction
    FT = [F1t;F2tis;F6is]; FC=[F1c;F2c;F6is];//uncomment for in-situ 
    Q_ = rotateQ(Q,orientation(k)); // transform lamina->laminate cs
    sigma_ = Q_ * eps_; // in laminate cs
    sigma(:,k) = rotateSigma_(sigma_,orientation(k));//laminate->lamina cs
    [R(k,1),R(k,2)] = maxStress(FT,FC,sigma(:,k));// see Appendix
end
R',sigma


