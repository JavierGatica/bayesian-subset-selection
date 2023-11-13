add_rm_paths('add')

M = 100000; % number of replications
k = 3; % number of systems
delta = 0.15;
alpha = 0.33;

for m = 1:M
    m
    means = rand(1,k);
    stdevs = rand(1,k) + 0.01;

    [S_greedy, pPGI_greedy] = greedy(means, stdevs, delta, alpha);
    
    subsets = nchoosek(1:k, length(S_greedy));

    for l = 1:size(subsets,1)
        pPGI = setPGI(subsets(l,:), means, stdevs, delta);
        if pPGI > pPGI_greedy
            save("data/greedy_not_optimal.mat")
            disp('Greedy is not optimal')
            return
        end
    end
end
