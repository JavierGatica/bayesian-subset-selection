add_rm_paths("add")

M = 1000; % number of replications
k = 5; % number of systems

for m = 1:M
    means = rand(1,k);
    stdevs = rand(1,k) + 0.01;

    [S_greedy, pPGI_greedy] = greedy(means, stdevs, delta, alpha);
    
    subsets = nchoosek(1:k, length(S_greedy));

    for l = 1:size(subsets,1)
        pPGI = setPGI(subsets(l,:), means, stdevs, delta);
        if pPGI > pPGI_greedy
            disp('Greedy is not optimal')
            return
        end
    end
end

