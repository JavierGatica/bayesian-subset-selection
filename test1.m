means = (1:10) * 0.1;
stdevs = ones(1,10) * 0.1;
delta = 0.15;

for i = 1:10
    a = derivative(i, [], means, stdevs, delta);
    b = CalcPostQty('PGS-Exact', i, means, stdevs .^ 2, ones(1,10), 'known', delta);
    a - b
end