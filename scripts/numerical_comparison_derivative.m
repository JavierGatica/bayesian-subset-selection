add_rm_paths("add")

M = 1000; % number of replications
k = 100; % number of systems


% hacer un loop que haga lo siguiente:

% 1. generar una instancia aleatoria

% 2. resolver greedy (N = tamaño greedy)

% 3. encontrar el conjunto de tamaño N que maximice pPGI

% 4. checkear si ese conjunto es el generado por greedy

% 5. si los conjuntos no son iguales -> greedy no es óptimo

means = rand(1,k);
stdevs = rand(1,k) + 0.01;
delta = 0.15;


S = randsample(1:k, 1);

derPGI = 0;
j = 0;
for i = S
    derPGI = derPGI + derivative(i,S(1:j),means,stdevs,delta);
    j = j+1;
end

derPGI

PGI = setPGI(S,means,stdevs,delta)


PGI2 = setPGI2(S,means,stdevs,delta)

