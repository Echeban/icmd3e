// Example-7-flywheel (Imperial units) FPS
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

// Imperial units
ID=6;//in
OD=10;
Sy = 30E3//psi
nu = 0.292;
rho = 0.282;//lb s^2/in (density==specific weight)
omega = 13000*2*%pi/60
// divide by 386 to get the stress in psi !
[sr,st] = rotatingDisk(ID/2,rho,omega,nu,ID,OD)/386; //psi
sigma_eq = vonMises(sr,st)
////[sr,st] = rotatingDisk(OD/2,rho,omega,nu,ID,OD)/386; //psi
////sigma_eq = vonMises(sr,st)
////r = sqrt(OD*ID/4)//max. sigma_r
////[sr,st] = rotatingDisk(r,rho,omega,nu,ID,OD)/386; // psi
////sigma_eq = vonMises(sr,st)
disp("===")

// SI units
ID = 6*25.4E-3;// m
OD = 10*25.4E-3;// m
Sy = 30E3/145// MPa
nu = 0.292;
rho = 7850// Kg/m^3
omega = 13000*2*%pi/60 // rad/s
[sr,st] = rotatingDisk(ID/2,rho,omega,nu,ID,OD); // Pa
sigma_eq = vonMises(sr,st)/1E6 // MPa
disp("===")

// micromechanics
//rho_IM7 = 1.78;// Table 2.1, g/cm^3
//rho_8552 = 1.301;// Table 2.14, g/cm^3
//rho = rho_IM7 * Vf + rho_8552 * (1-Vf);// g/cm^3
//rho = rho * 1000// g/cm^3 => Kg/m^3
