function pPGI = setPGI2(S, means, stdevs, delta)
    k = length(means);
    f = @(w, i) prod(normcdf(w - delta, means(S), stdevs(S))) * prod(normcdf(w, means(setdiff(1:k, union(S, i))), stdevs(setdiff(1:k, union(S,i)))));

    pPGI = 1;

    for i = setdiff(1:k, S)
        g = @(W) arrayfun(@(w) f(w, i), W);
        pPGI = pPGI - norm_quad(g, means(i), stdevs(i));
    end
end