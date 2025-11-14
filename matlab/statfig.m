% demonstrating basic data visualisation  
% c.koch | 05.09.2017 

%% generate random samples with different mean and variance...
disp('-> Generate and display random samples with different mean and variance')

% ... unimodal
a = 5.*randn([1 1000])+40;
[h centers] = hist(a,100);   
figure(10); plot(a)
figure(20); plot(centers,h)
stats = [mean(a) std(a) var(a) max(h)]  
varplot(stats,20)

% ... bimodal
b = 20.*randn([1 1600])+120;
b = [a b];     % concatenation of samples with different mean and variance
[h centers] = hist(b,100);
figure(30); plot(b)
figure(40); plot(centers,h)
stats = [mean(b) std(b) var(b) max(h)]
varplot(stats,40)

%% alternative: ready-to-go boxplot with median and 25/75 percentile
figure(50)
group = [repmat({'Unimodal'}, 1000, 1); repmat({'Bimodal'}, 2600, 1)];
boxplot([a'; b'], group)

%% save all figures to disk
figHandles = findobj('Type', 'figure');

for i = figHandles'
    sOutFile = ['statfig_' num2str(i) '.pdf'];
    disp(['-> Save file ' sOutFile])
    saveas(i,sOutFile);
end
    
