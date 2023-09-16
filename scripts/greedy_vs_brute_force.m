add_rm_paths("add")
k = 10;
M = 200; % replications of the experiment

alpha = 0.15;
delta = 0.10;

subset_size_greedy = zeros(1,M);
subset_size_brute = zeros(1,M);

for m = 1:M
    means = sort(rand(1,k));
    stdevs = rand(1,k) + 0.01;
    [S, ~] = greedy(means, stdevs, delta, alpha);
    subset_size_greedy(m) = length(S);
    length(S)
    [S, ~] = brute_force(means, stdevs, delta, alpha);
    subset_size_brute(m) = length(S);
    length(S)
    m
end

