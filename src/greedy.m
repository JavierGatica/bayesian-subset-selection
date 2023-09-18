function [subset, pPGI] = greedy(means, stdevs, delta, alpha)

    k = length(means);
    subset = [];
    pPGI = 0;
    for step = 1:k
        Scomp = setdiff(1:k, subset);
        [~, jmax] = max(arrayfun(@(i) derivative(i, subset, means, stdevs, delta), Scomp));
        subset = [subset Scomp(jmax)];
        pPGI = setPGI(subset, means, stdevs, delta);
        if pPGI > 1 - alpha
            break
        end
    end
end