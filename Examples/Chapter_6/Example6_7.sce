// Example 6.7
clc; mode(0); 
P = 1000; // Newton
L = 2000; // mm
delta = L/300;
// E-glass/polyester
trQ = 57160; // MPa Table 1.2
G12 = 3300; // Table 1.2
Gs = 7597; // G* Table 1.2
// carpet plot 80/10/10
x = 10; // %pm45
Exs = 0.58; // dimensionless, from carpet plot
Ex = Exs * trQ // value with units
Gxy = Gs * x/100 + G12 // value with units
// calculate
I = (300*P*L^2)/(3*Ex)
h = (96*I)^(1/4)
// take
h = 188 // mm
b = h/2
t = b/20
Aw = 2*h*t
I = h^4/96
delta_s = (P*L)/(Gxy*Aw)
delta_b = (P*L^3)/(3*Ex*I)
detta_t = delta_b + delta_s

