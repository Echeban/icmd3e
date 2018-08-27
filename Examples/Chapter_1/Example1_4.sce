// Example 1.4 Scilab
mode(0)
function p = Gauss(x,mu,std)
    // Eq. (1.5) probability density function
    p = 1/std/sqrt(2*%pi)*exp(-1/2*((x-mu)/std).^2)
endfunction
// data
x = [66 69 58 100 83 42 54 69 49 64 59 30 51 67 64 53 64..
    58 49 81 49 77 70 73 64 58 89 80 82 67 87 74 62 63 51 80];
// calculations
mu = mean(x)
std = stdev(x)
COV = std/mu
histplot(7,x);
xtitle('','Strength F','probability p(F)')
xx = [min(x):1:max(x)];
pdensity = Gauss(xx,mu,std);
plot(xx,pdensity)
