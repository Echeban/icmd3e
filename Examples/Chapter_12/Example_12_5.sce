// Example 12.5
mode(0)
function residual = residual(x)
    residual = 0.3*E*(x/a)^2*(1-.00875*(phimax-20))*(1-.000175*a/x)-qcr
endfunction
a = 31.2;//m
E = 19.0E9;//N/m^2, from carpet plots
phimax = 22.62; //deg
qcr = 11632;//N/m^2
t_guess = 0.1;
t = fsolve(t_guess,residual)
