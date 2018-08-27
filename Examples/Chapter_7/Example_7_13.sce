// Example 7.13 : flywheel
mode(0)
function [sigma_r,sigma_t] = rotatingDisk(r,rho,omega,nu,ID,OD)
    //Eq. 3-55 p. 129, Shigley's 10 edition
    r_i = ID/2
    r_0 = OD/2
    c = rho * omega^2 * (3 + nu) / 8
    sigma_r = c * ( r_i^2 + r_0^2 - (r_i*r_0/r)^2 - r^2 ) 
    sigma_t = c * ( r_i^2 + r_0^2 + (r_i*r_0/r)^2 - (1+3*nu)/(3+nu) * r^2 ) 
endfunction
function sigma_eq = vonMises(sigma_I,sigma_II)
    sigma_eq = sigma_I^2 - sigma_I*sigma_II + sigma_II^2 
    sigma_eq = sqrt(sigma_eq)
endfunction

ID = 150*1E-3;// m
OD = 250*1E-3;// m
phi = 0.6667
// IM7/8552, 50[%pm45], 25%[90]
F_1t = 2326.2;// MPa Table 1.4
F_x_star = 0.395;// Fig. 7.13
F_x = F_x_star * F_1t // MPa
F_x = phi * F_x
nu = 0.3;//Fig. 6.11
Vf = 0.591;//Table 1.4
rho = 1.55E3;//Table 1.4, Kg/m^3
n_0 = 10000;
omega = n_0*2*%pi/60 // rad/s
[sr,st] = rotatingDisk(ID/2,rho,omega,nu,ID,OD)/1E6; // MPa
st
R = F_x/st
sqrt(R)
omega = omega * sqrt(R)
n = n_0 * sqrt(R)
[sr,st] = rotatingDisk(ID/2,rho,omega,nu,ID,OD)/1E6; // MPa
st
R = F_x/st
