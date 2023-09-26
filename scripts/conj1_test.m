% this experiment checks if the greedy heuristic is optimal under partially ordered
% systems. If this doesn't hold, then conjecture 1 is not true.

add_rm_paths("add")
k = 10;
M = 1000; % replications of the experiment


alpha = 0.05;
delta = 0.15;

subset_size_diff = zeros(1,M);

for m = 1:M
    m
    %means = (1:k) * delta / 2 + sort(rand(1,k));
    %stdevs = sort(rand(1,k) + 0.1);

    % I added this not-partially-ordered systems because greedy is optimal and I don't know why
    means = rand(1, k);
    stdevs = rand(1, k) + 0.01;

    [S_greedy, ~] = greedy(means, stdevs, delta, alpha)
    [S_brute_force, ~] = brute_force(means, stdevs, delta, alpha, length(S_greedy) - 1)
    subset_size_diff(m) = length(S_greedy) - length(S_brute_force);
    if subset_size_diff(m) > 0
        disp "Contradiction to conjecture 1 found\n"
        break
    end
end

% greedy needs to be the best subset of size N to be optimal (?)

% - run brute force to reach the best subset and compare with greedy