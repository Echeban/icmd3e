// Example 7.10: [45/0/90/-45]_S, truncated max. strain
mode(0); funcprot(0); clc; clear;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix CLT.sci
E1 = 126E3; E2 = 11E3; G12 = 6.6E3; //MPa, AS4/3501-6
v12 = 0.28; tt = 0.8; tk = 0.125; //mm
F1t = 1950; F1c = 1480; F2t = 48; F2c = 200; F6 = 79;//MPa
 orientation=[45,0,90,-45,-45,90,0,45];
 thickness=[1,1,1,1,1,1,1,1]*tk;
N = [0;0;1] //change sign here to reverse the load
Q = buildQ(E1,E2,G12,v12);
A = buildABD(Q,thickness,orientation);
eps_ = A\N
n=length(orientation);
for k=1:n/2
    eps(:,k) = rotateEps_(eps_,orientation(k)); // laminate -> lamina
end
eps*1E6
eps1 = eps(1,1), eps2 = eps(2,1), //largest values of normal strain
e1t = F1t/E1, e1c=F1c/E1, // calculated failure strains
R1 = e1c/eps1
R6 = (1+v12)*max(e1t,e1c)/abs(eps1-eps2)
R = min(R1,R6)

