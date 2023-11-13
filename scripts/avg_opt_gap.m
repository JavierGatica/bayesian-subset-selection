% this experiment store the subset sizes of brute force and greedy
% algorithms to compare them and analyze the optimality gap.

%add_rm_paths('add')

%load("data/avg_opt_gap.mat")

M = 500;
k = 10;
delta = 0.15;
alpha = 0.1;

%subset_size_greedy = zeros(1,M); 
%subset_size_bf = zeros(1,M);

pPGI_greedy = zeros(size(subset_size_greedy));
pPGI_bf = zeros(size(subset_size_bf));

for m = 211:M
    m
    means = rand(1, k);
    stdevs = rand(1, k) + 0.01;

    [subset_greedy, pPGI_greedy(m)] = greedy(means, stdevs, delta, alpha);
    [subset_bf, pPGI_bf(m)] = brute_force(means, stdevs, delta, alpha, 1);

    subset_size_greedy(m) = length(subset_greedy);
    subset_size_bf(m) = length(subset_bf);
end

%save("avg_opt_gap_data.mat")