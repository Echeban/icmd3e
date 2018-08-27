// Example 11.1
mode(0);
function [Z,d] = Hat(a,b,c,w,h,ts,we)
    // calculates section modulus of hat stiffener
    te = ts*sqrt(b^2+h^2)/h // effective thickness of webs
    A = w*(ts+tsk) + a*ts + 2*h*te
    Q = a*ts*h + 2*te*h*(h/2)
    Io = a*ts*h^2 + 2*te*h^3/3 //w.r.t. z=0
    zcg = Q/A
    I = Io - A*zcg^2
    d = max(zcg,h-zcg) //farthest distance to the n.a.
    Z = I/d //section modulus
endfunction
// Glass/Epoxy
F1t = 903; // MPa
F1c = 357;
phi_wet = 0.8;
alpha = 1.5;
// load
p = 0.1735;//MPa
// from carpet plots for Qi [0/45/-45/90]
Fxbs = 0.55;
Fxts = 0.48;
Fxcs = 0.5;
Fxb = Fxbs * F1c // compression failure
Fxt = Fxts * F1t // tension failure
Fxc = Fxcs * F1c // compression failure
// design
lr = 1250; //mm bulkead spacing
ls = 150; //mm stiffener spacing
b = 10; //mm skin strip
Mskin = p*b*ls^2/10 // max. moment on the continuous supported strip
// skin
tsk = sqrt ( (alpha*6*Mskin)/(b*phi_wet*Fxb) )
// stiffeners
q = p*ls // stiffener load per init length 
Mstiffener = q*lr^2/12 // clamped at the bulkhead
Zreq = (alpha*Mstiffener)/(phi_wet*Fxc) // required section modulus
// stiffener dimensions
a   =30
b   =12
c   =b
w   =a+2*(b+c)
h	=w
//
ts = 1.2*tsk // stiffener walls thickness 
Z = Hat(a,b,c,w,h,ts,we)
// increase ts
ts = 1.4*tsk // stiffener walls thickness 
Z = Hat(a,b,c,w,h,ts,we)
