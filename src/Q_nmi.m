function Q=Q_nmi(A,B,F)
    mi_af = entropy(A) + entropy(F) - H(A, F);
    mi_bf = entropy(B) + entropy(F) - H(B, F);
    Q = 2*( mi_af / (entropy(A) + entropy(F)) + mi_bf / (entropy(B) + entropy(F)) );
end

function E=H(A,B)
    % Compute the joint histogram
    numBins = 256;  % Number of bins for the intensity values
    jointHistogram = histcounts2(A(:), B(:), numBins);

    % Calculate the joint probability
    jointProbability = jointHistogram / numel(A);
    
    p = nonzeros(jointProbability(:));
    E = -sum(p.*log2(p));
end 

