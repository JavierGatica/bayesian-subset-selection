add_rm_paths('add')

k = 6;
delta = 1/(k-1.5);
subset_size = 3;

mu_p = 0.5;
rho_p = 0.5;

means = [rand(1,k-1) mu_p];
stdevs = [rand(1,k-1) rho_p];

subset = randsample(k-1,subset_size)';

mu = linspace(0,1,15);
rho = linspace(0.01,1,15);

[X, Y] = meshgrid(mu,rho);

f = zeros(size(X));

i = 1;
j = 1;

for rho_q = rho
    j = 1
    for mu_q = mu
        means(subset(end)) = mu_q;
        stdevs(subset(end)) = rho_q;
        f(i,j) = setPGI(subset, means, stdevs, delta) - setPGI([subset(1:end-1) k], means, stdevs, delta);
        j = j + 1
    end
    i = i + 1
end

close all

hold on
contourf(X,Y .^ 2,f)
plot(means(setdiff(1:k, subset(end))), stdevs(setdiff(1:k,subset(end))), 'r*')
plot(means(subset(1:end-1)), stdevs(subset(1:end-1)), 'g*')

plot([means(end) max(mu)], stdevs(end)*ones(1,2), 'r')
plot(means(end)*ones(1,2), [stdevs(end), max(rho)], 'r')
plot([min(mu), means(end)], stdevs(end)*ones(1,2), 'b')
plot(means(end)*ones(1,2), [min(rho) stdevs(end)], 'b')
colorbar


% check if curve estimation is good

means(subset(end)) = mu_p;
stdevs(subset(end)) = rho_p;

pPGIS = setPGI([subset(1:end-1) k], means, stdevs, delta);

pgi_est = @(mu) 1 - prod(normcdf(mu+delta, means(setdiff(1:k, subset(end))))) * prod(normcdf(mu, means(subset(1:end-1)), stdevs(subset(1:end-1)))) - pPGIS;


mu_0 = fzero(pgi_est , 0.5);

%mu_0 = max(means(setdiff(1:k,subset(end))));

rhos = linspace(0, stdevs(end), 10);
g_curve = (means(end) - mu_0) / (stdevs(end)^2) * rhos .^2 + mu_0;

%plot(g_curve, rhos, 'b')

hold off

add_rm_paths('remove')
