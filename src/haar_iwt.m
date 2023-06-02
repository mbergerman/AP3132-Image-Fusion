function iw_image = haar_iwt(w_image)
    % Create a copy of the wavelet decomposed image
    iw_image = w_image;
    
    level = floor(log2(min(size(w_image,[1 2]))));
    
    % set the wavelet type to haar
    wavename = 'haar';

    % Use idwt2() to implement full 2D wavelet reconstruction
    for j = 0:level-1

        % Select the coarse scale (subimage)
        Coarse = iw_image(1:2^(j+1) , 1:2^(j+1));

        % Set the coarse scale size
        cA=Coarse(1:size(Coarse,1)/2,1:size(Coarse,2)/2);
        cH=Coarse(1:size(Coarse,1)/2,size(Coarse,2)/2+1:size(Coarse,2));
        cV=Coarse(size(Coarse,1)/2+1:size(Coarse,1),1:size(Coarse,2)/2);
        cD=Coarse(size(Coarse,1)/2+1:size(Coarse,1),size(Coarse,2)/2+1:size(Coarse,2));

        % Apply idwt2 to coarse scale
        % Carefully choose cA and details matrices cH, cV, and cD
        wcomp = idwt2(cA, cH, cV, cD, wavename);

        % Substitute wavelet component into coarse scale
        iw_image(1:2^(j+1) , 1:2^(j+1)) = wcomp;
    end
end