// Ex. shaft with bending
mode(0);clc;clear;
function sigma = beam(d0)
    di = 0;
    sigma = abs(32*M*d0/%pi/(d0^4-di^4) - Sy)
endfunction
function tau = shaft(d0)
    di = 0;
    tau = abs(16*T*d0/%pi/(d0^4-di^4) - Sy/2)
endfunction
function tauMax = tauMax(d0)
    di = 0;
    sigma = abs(32*M*d0/%pi/(d0^4-di^4))
    tau = abs(16*T*d0/%pi/(d0^4-di^4))
    tauMax = abs( sqrt( (sigma/2)^2 + tau^2 ) - Sy/2 )
endfunction
// US customary, steel, Pb-5-64 Shigley's
Sy = 67000;// psi
phi = 1/2; Sy = phi*Sy;//safety factor n=2 in Shigley's
M = 1055;// lbf in, 
T = 1000;
//db = fminsearch(beam,1)
//ds = fminsearch(shaft,1)
//d = fminsearch(tauMax,1)

// SI units, steel, Pb-5-64 Shigley's
Sy = 67000/145;// MPa
phi = 1/2; Sy = phi*Sy;//safety factor n=2 in Shigley's
M = 1055*4.448*25.4// N mm 
T = 1000*4.448*25.4
db = fminsearch(beam,1)
ds = fminsearch(shaft,1)
d = fminsearch(tauMax,1)

