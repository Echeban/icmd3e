% Example 1.11 MATLAB
F = [443.2, 444.1, 468.8, 444.6, 447.8]
n = length(F);
mu = mean(F)
warning('off','stats:mle:ChangedParameters');% suppress warnings
mleParams = mle(F,'distribution','Weibull')
lhat = mleParams(1);
mhat = mleParams(2);
% C-basis
Q = 0.95; % coverage
C = 0.95; % Confidence
% from Table
V_QC = 13.333;
% basis value
f_QC = lhat*(-log(Q))^(1/mhat) * exp(-V_QC/mhat/sqrt(n))
