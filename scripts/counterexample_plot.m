add_rm_paths('add')

k = 3;
delta = 0.15;
subset_size = 2;

% system 2
mu_p = 0.326034284066419;
rho_p = 0.257024179264040;


% systems: 1 3 2
means = [0.156807887544396, 0.314061928673465, mu_p];
stdevs = [0.904500663904255, 0.320679015912649, rho_p];

subset = [1 2]; % best subset in this case


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
        f(i,j) = setPGI(subset, means, stdevs, delta) - setPGI([subset(1:end-1) k],...
            means, stdevs, delta);
        j = j + 1
    end
    i = i + 1
end

close all

hold on
contourf(X,Y,f)
plot(means(setdiff(1:k, subset(end))), stdevs(setdiff(1:k,subset(end))), 'b*')
plot(means(subset(1:end-1)), stdevs(subset(1:end-1)), 'b*')

plot([means(end) max(mu)], stdevs(end)*ones(1,2), 'r')
plot(means(end)*ones(1,2), [stdevs(end), max(rho)], 'r')
plot([min(mu), means(end)], stdevs(end)*ones(1,2), 'b')
plot(means(end)*ones(1,2), [min(rho) stdevs(end)], 'b')
xlabel("mean")
ylabel("standard deviation")
colorbar

hold off

add_rm_paths('remove')