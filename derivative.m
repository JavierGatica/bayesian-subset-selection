function delta_i = derivative(i, S, means, stdevs, delta)

    k = length(means);

    % first integral
    compset = setdiff(1:k, union(S, i));
    f = @(w) prod(normcdf(w - delta, means(S), stdevs(S))) * prod(normcdf(w, means(compset), stdevs(compset))) * ...
                                                                                        normpdf(w, means(i), stdevs(i));
    f = @(W) arrayfun(f, W);

    delta_i = integral(f, -Inf, Inf);

    % sum of integrals
    for l = compset
        compsetl = setdiff(compset, l);
        f = @(w) prod(normcdf(w - delta, means(S), stdevs(S))) * prod(normcdf(w, means(compsetl), stdevs(compsetl))) * ...
            (normcdf(w, means(i), stdevs(i)) - normcdf(w - delta, means(i), stdevs(i))) * normpdf(w, means(l), stdevs(l));
        f = @(W) arrayfun(f, W);
        delta_i = delta_i + integral(f, -Inf, Inf);
    end
end 