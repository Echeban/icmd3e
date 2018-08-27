// Examples 1.1 and 1.2 Scilab
mode(0);clear;clc;
// Mohr circle problems
function [s1,s2,R,phip,phis] = Mohr(sx,sy,sxy)
    // Mohr circle of stress
    C = (sx + sy)/2
    D = (sx - sy)/2
    R = D^2 + sxy^2
    if (R ~= 0) then
        R = sqrt(R)
    end
    s1 = C + R
    s2 = C - R
    phip = %pi/4 //if D==0, then on circle: 2*phip=pi/2
    if (D ~= 0) then
        phip = atan(sxy,D) / 2 //divide by 2 to take to stress element
    end
    phis = %pi/4 + phip // angle to max. shear
    phip = phip*180/%pi
    phis = phis*180/%pi
endfunction

// data
sx = 400;
sy = 100;
sxy = -200;

// Answers
[s1,s2,R,phip,phis] = Mohr(sx,sy,sxy)


