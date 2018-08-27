// Example 6.8: [0_7/45/-45/90]_r
clc; mode(0); 
P = 1000;//Newton
L = 2000;// mm
delta = L/300;
// E-glass/polyester
trQ = 57160; //MPa Table 1.2
G12 = 3300; // Table 1.2
Gs = 7597; // G* Table 1.2
tk = 0.125; // one ply
t = 10*tk // laminate thickness
// carpet plot 80/10/10
x = 20; // %pm45
Exs = 0.53; // dimensionless, from carpet plot
Ex = Exs * trQ // value with units
Gxy = Gs * x/100 + G12 // value with units
//calculate with several values of r
r = [1,2,3,4] // try until satisfied
t = r*10*tk
b = 20*t
h = 2*b
I = t .* (h .^ 3 ./ 6 + b .* h. ^2 ./ 2)
delta_b = (P .* L .^3) ./ (3 .* Ex .* I)
Aw = 2 .* h .* t
delta_s = (P .* L) ./ (Gxy .* Aw)
detta_t = delta_b + delta_s

