add_rm_paths("add")
M = 500;
k = 10;
delta = 0.15;
alpha = 0.1;

subset_size_greedy = zeros(1,M); 
subset_size_bf = zeros(1,M);

for m = 28:M
    m
    means = rand(1, k);
    stdevs = rand(1, k) + 0.01;

    subset_greedy = greedy(means, stdevs, delta, alpha)
    subset_bf = brute_force(means, stdevs, delta, alpha, 1)

    subset_size_greedy(m) = length(subset_greedy);
    subset_size_bf(m) = length(subset_bf);
end

save("avg_opt_gap_data.mat")