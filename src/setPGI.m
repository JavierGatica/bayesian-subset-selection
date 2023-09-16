function pPGI = setPGI(S, means, stdevs, delta)
    pPGI = 0;
    for i = 1:length(S)
        pPGI = pPGI + derivative(S(i), S(1:(i-1)), means, stdevs, delta);
    end
end