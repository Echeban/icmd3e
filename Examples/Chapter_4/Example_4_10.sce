// Example 4.10
// find alpha that maximizes (4.77)
mode(0)
function gMC = gMC(alfa)
    // Mohr-Coulomb activation function
    sn = s2*cosd(alfa)^2//normal stress
    tauT = -s2*sind(alfa)*cosd(alfa)//transverse shear on the fracture plane
    tauL = s6*cosd(alfa)//longitudinal shear on the fracture plane
    gMC = (tauT/(F4-nT*sn))^2 + (tauL/(F6-nL*sn))^2 - 1
    gMC = - gMC// negated to use fminsear to find its maximum
endfunction

s2 = -40;
s6 = 70;

alpha0 = 53;//deg
F6 = 61;//MPa E-glass/LY556
F2c = 138;//MPa

F4 = F2c*cosd(alpha0)*(sind(alpha0)+cosd(alpha0)/tand(2*alpha0))
nT = -tand(2*alpha0)^-1
nL = -F6*cosd(2*alpha0)/(F2c*cosd(alpha0)^2)

alphaMin = fminsearch(gMC,55)
g = - gMC(alphaMin)// negated to recover the maximum
IF = 1 + g
R = 1/IF
