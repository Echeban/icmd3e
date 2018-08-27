// Example 5.4
mode(0); //prints everything not suppressed with ;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci',0); // include CLT.sci

theta = -55;
eps = [3.635; 7.411; 0]*1E-3;// lamina c.s
eps(3) = eps(3)/2;
eps_ = Tinv*eps;// laminate c.s.
eps_(3) = eps_(3)*2;
eps_

