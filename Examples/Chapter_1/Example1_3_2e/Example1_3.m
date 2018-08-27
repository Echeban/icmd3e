% Example 1.3
clc; clear
[F txt] = xlsread('Table1_1.xlsx') % read data
ndata = length(F) % number of data points
% Histogram
n = 7; % number of bins
[Hist,centers] = hist(F,n)
binwidth = (max(F)-min(F))/n;
NHist = Hist/(ndata*binwidth); % normalizes the histogram 
bar(centers,NHist,'FaceColor','none','LineWidth',2); hold on
% probability density
F = sort(F); % sort for plotting a line
m = mean(F)
v = std(F)
p = pdf('norm',F,m,v)
plot(F,p,'k','LineWidth',2);
% labels
xlabel('Strength F','FontSize',14,'FontName','Arial'); 
ylabel('Probability p(F)','FontSize',14,'FontName','Arial');
axis([30 100 0.0 0.04]);
set(gca,'FontSize',14,'FontName','Arial'); 
legend('Histogram','PDF');
saveas(gca,'./Histogram.example.1.3','png');
hold off

