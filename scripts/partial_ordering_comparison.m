add_rm_paths('add')

means = (1:10) * 0.1;
stdevs = (1:10) * 0.1;
delta = 0.14;

test_systems = sort([9, 10]);
n = length(test_systems);

test_derivatives = test_systems;

for m = 1:(10 - n)

    subsets = nchoosek(setdiff(1:10, test_systems), m);

    for l = 1:size(subsets,1)

        test_derivatives = [test_derivatives ; zeros(1, n)]; %#ok<AGROW>

        for i = 1:n
            test_derivatives(end, i) = derivative(test_systems(i), subsets(l,:), means, stdevs, delta);
        end
    end
    m 
end

for j = 1:(n-1)
    disp(all(test_derivatives(:, j + 1) > test_derivatives(:, j)))
end