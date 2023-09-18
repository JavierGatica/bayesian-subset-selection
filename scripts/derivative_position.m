k = 20;
means = (1:k) * delta / 2 + sort(rand(1,k));
stdevs = sort(rand(1,k) + 0.1);

derivative_order = zeros(k,k);

subset = [];
[~, idx] = sort(arrayfun(@(i) derivative(i, subset, means, stdevs, delta), 1:k));
means = means(idx);
stdevs = stdevs(idx);

for step = 1:k
    step
    Scomp = setdiff(1:k, subset);
    [~, idx] = sort(arrayfun(@(i) derivative(i, subset, means, stdevs, delta), Scomp));
    derivative_order(step,step:k) = Scomp(idx);
    subset = [subset Scomp(idx(end))];
end

    





