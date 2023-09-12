mean_j = 0.8;
sdev_j = 0.01;
R = 10000;
delta = 0.05;

k = 100;
means = betainv(linspace(0,1,k), 4, 2);
sdevs = ones(1,k) * 0.01;

[pPGSj, estimation] = est_pgs(means, sdevs, mean_j, sdev_j, R, delta);
pPGSj

close all
[X, Y] = meshgrid(linspace(0,1,k), 1:R);
s = pcolor(X,Y, estimation);
s.EdgeColor = 'none';
colorbar
xlabel('Expected value of system mean')
ylabel('Monte Carlo replication result')

hold on
plot([mean_j mean_j], [1 R], 'r--', 'LineWidth', 4)
hold off

pPGS = zeros(1,100);
for i = 1:100
    [pPGS(i), ~] = est_pgs(means, sdevs, 1.2 * i / 100, 0.05, 1000, delta);
end
figure
plot(pPGS)


function [pPGSj, estimation] = est_pgs(means, sdevs, mean_j, sdev_j, R, delta)
k = length(means);

Wj = normrnd(mean_j, sdev_j, R, 1) + delta;

estimation = normcdf(repmat(Wj,1,k), repmat(means,R,1), repmat(sdevs,R,1));


pPGSj = prod(estimation, 2);
pPGSj = mean(pPGSj, 1);

end