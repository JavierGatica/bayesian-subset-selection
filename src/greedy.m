function [subset, pPGI] = greedy(means, stdevs, delta, alpha)

    k = length(means);
    subset = [];
    pPGI = 0;
    for step = 1:k
        [Dmax, jmax] = max(arrayfun(@(i) derivative(i, subset, means, stdevs, delta), setdiff(1:k, subset)));
        subset = [subset jmax];
        pPGI = pPGI + Dmax;
        if pPGI > 1 - alpha
            break
        end
    end
end