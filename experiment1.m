means = 0.1:0.1:1;
stdevs = (10:-1:1)*0.1;
delta = 0.07;

test_systems = [4, 6, 7, 8];
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


