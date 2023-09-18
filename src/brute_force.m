function [subset, pPGI] = brute_force(means, stdevs, delta, alpha, start)

    k = length(means);

    for m = start:k
        subsets = nchoosek(1:k, m);
        for l = 1:size(subsets,1)
            pPGI = setPGI(subsets(l,:), means, stdevs, delta);
            if pPGI > 1 - alpha
                subset = subsets(l,:);
                return
            end
        end
    end    
end