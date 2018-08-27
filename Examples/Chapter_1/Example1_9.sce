// Example 1.9 Scilab
mode(0)
F = [985,1015];//data in [MPa]
n = length(F)
f_ = mean(F) // of sample
s_ = stdev(F) // of sample
// from Table 1.8 with n=2
// A-basis
kQC = 37.094; 
fA = f_ - kQC * s_
// B-basis
kQC = 20.581; 
fA = f_ - kQC * s_
// C-basis
kQC = 26.260; 
fA = f_ - kQC * s_
// from Table 1.8 with n=15
// A-basis
kQC = 3.5201; 
fA = f_ - kQC * s_
// B-basis
kQC = 2.0684; 
fA = f_ - kQC * s_
// C-basis
kQC = 2.566; 
fA = f_ - kQC * s_
