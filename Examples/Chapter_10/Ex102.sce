// Ex. 10.2, cont'd 6.6
mode(0)
P = 1000;
L = 2000;
t = 4.7;//mm
b = 20*t
h = 2*b
I = h^4/96
Q = t*b*h/2+2*t*h^2/8
Fxs = 0.87//from carpet
Fxys= 0.4010*10/100+0.0884
Fxt = Fxs*903
Fxc = Fxs*357
Fxy = Fxys*357
M = P*L
V = P
sx = M*h/(2*I)
Rb = Fxc/sx
tau = Q*V/(I*2*t)
Rs = Fxy/tau

