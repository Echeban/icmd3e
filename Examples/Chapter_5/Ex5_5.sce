// Example 5.5
mode(0); //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci

theta = 26.57;
sigma_ = [400; 100; -200];// laminate c.s. [MPa]
FT = [1020; 40; 60];// strength of E-glass/Epoxy Table 1.1

T = transf(theta);
sigma = T*sigma_ // lamina c.s.
sigma(3) = abs(sigma(3));//shear strength independent of sign
R = FT./sigma;
R = min(R)

