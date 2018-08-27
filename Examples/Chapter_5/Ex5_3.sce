// Example 5.3 
mode(0); //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci

theta = -55;
sigma = [100; 10; -5];// lamina c.s
T = transf(theta)
Tinv = transf(-theta)
sigma_ = Tinv*sigma // laminate c.s.

