% this experiment aims to visualize the change in the relative order of the discrete
% derivatives of all systems throughout the execution of the greedy heuristic

k = 20;

%this is a partially ordered set of systems
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

pcolor(derivative_order)
xlabel("system index (initially sorted by their derivatives)")
ylabel("step in the greedy heuristic")





