add_rm_paths("add")
k = 10;
M = 200; % replications of the experiment

alpha = 0.05;
delta = 0.15;

subset_size_diff = zeros(1,M);

for m = 1:M
    m
    means = (1:k) * delta / 2 + sort(rand(1,k));
    stdevs = sort(rand(1,k) + 0.1);
    [S_greedy, ~] = greedy(means, stdevs, delta, alpha)
    [S_brute_force, ~] = brute_force(means, stdevs, delta, alpha, length(S_greedy) - 1)
    subset_size_diff(m) = length(S_greedy) - length(S_brute_force);
    if subset_size_diff(m) > 0
        disp "Contradiction to conjecture 1 found"
        break
    end
end