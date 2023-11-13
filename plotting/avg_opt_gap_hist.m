%add_rm_paths('add')

%load("data/avg_opt_gap_data.mat")

filter = subset_size_bf ~= 0 & subset_size_greedy ~= 0;

ss_bf = subset_size_bf(filter);
ss_g = subset_size_greedy(filter);

[N_bf,edges_bf] = histcounts(ss_bf);
edges_bf = edges_bf(2:end) - (edges_bf(2)-edges_bf(1))/2;

[N_g,edges_g] = histcounts(ss_g);
edges_g = edges_g(2:end) - (edges_g(2)-edges_g(1))/2;

plot(edges_bf, N_bf)
hold on
plot(edges_g, N_g)
hold off

filter2 = pPGI_greedy ~= 0 & pPGI_bf ~= 0;

[N_bf,edges_bf] = histcounts(pPGI_bf(filter2));
edges_bf = edges_bf(2:end) - (edges_bf(2)-edges_bf(1))/2;

[N_g,edges_g] = histcounts(pPGI_greedy(filter2));
edges_g = edges_g(2:end) - (edges_g(2)-edges_g(1))/2;

figure
hold on
plot(edges_bf, N_bf)
plot(edges_g, N_g)
legend("brute force", "greedy")
hold off

%add_rm_paths('remove')