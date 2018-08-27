// Ex. 7.14, verified with Shigley's Pb. 5-64 (steel)
mode(0);clc;clear;
exec('C:\Users\EJB\OneDrive\Scilab\CLT.sci');// see Appendix CLT.sci
function residual_sigma = beam(d0)
    di = d0 - 2*t;
    residual_sigma = abs(32*M*d0/%pi/(d0^4-di^4) - F_x_all)
endfunction
function residual_tau = shaft(d0)
    di = d0 - 2*t;
    residual_tau = abs(16*T*d0/%pi/(d0^4-di^4) - F_xy_all)
endfunction

// SI units, IM7/8552
alpha = 1.;//load factor
phi = 1/2;//resistance factor
// Shigley's Pb. 5-64 M=1055, T=1000
c = 113000//N mm
M = c * alpha;// 
T = c * alpha;// 
// LSS: [(0/pm45/90)]_r
t_k = 0.125;//mm Table 1.4
// orientation =[0,45,-45,90,90,-45,45,0];// symmetric
orientation =[0,45,-45,90,0,45,-45,90];// asymmetric avoids clustering
thickness   =[1,1,1,1,1,1,1,1]*t_k;
n = length(thickness);
t = sum(thickness)
// IM7/8552, 50[%pm45], 25%[90]
F_1t = 2326.2;// MPa Table 1.4
F_1c = 1200.1;// MPa Table 1.4
F_x_star = 0.395;// Fig. 7.13
F_x_all = phi * F_x_star * F_1c // MPa, compression is critical
F_xy_star = 0.3524*50/100 + 0.0884 // Eq. 
F_xy_all = phi * F_xy_star * F_1c // MPa, shear 
// uncoupled design
// t = 9.6;// steel solid shaft
// F_x_all = phi*67000/145;// MPa, steel, t/c=Sy
db = fminsearch(beam,25)// guess db=25 mm
// F_xy_all = phi*67000/145/2;// MPa steel, Shear=Sy/2
ds = fminsearch(shaft,25)// guess ds=25 mm

// buckling
d0 = max(db,ds);//mm chosen as controling from above
di = d0 - 2*t;
r = (d0+di)/4
r/t
Estar = 0.34;// Figure 6.10
v = 0.3;// Figure 6.11
trQ = 192.0E3;//MPa, Table 1.4
E = Estar * trQ
M_cr = 0.72*E*r*t^2/(1-v^2);//Table 15.2.16 Roark 7e
M_cr/M
L = 300;//mm
H = sqrt(1-v^2)*L^2/t/r
//T_cr = 0.75*2*%pi*r^2*t*E/(1-v^2)*(t/L)^2*(1.27+sqrt(9.64+0.466*H^(3/2)));//17a hinged ends
T_cr = 0.75*2*%pi*r^2*t*E/(1-v^2)*(t/L)^2*(-2.39+sqrt(96.9+0.605*H^(3/2)));//17b clamped ends
T_cr/T

