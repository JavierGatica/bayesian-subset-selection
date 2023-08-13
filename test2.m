means = (1:10) * 0.1;
stdevs = ones(1,10) * 0.1;
delta = 0.15;

pPGI = derivative(i, [], means, stdevs, delta);
for i = 2:10
    pPGI = pPGI + derivative(i, 1:(i - 1), means, stdevs, delta);
end

pPGI