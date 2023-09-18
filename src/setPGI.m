function pPGI = setPGI(S, means, stdevs, delta)
    k = length(means);
    f = @(w, i) prod(normcdf(w - delta, means(S), stdevs(S))) * prod(normcdf(w, means(setdiff(1:k, union(S, i))), stdevs(setdiff(1:k, union(S,i))))) * ...
        normpdf(w, means(i), stdevs(i));

    pPGI = 1;

    for i = setdiff(1:k, S)
        g = @(W) arrayfun(@(w) f(w, i), W);
        pPGI = pPGI - integral(g, -Inf, Inf);
    end
end