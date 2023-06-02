function w_image = haar_wt(image)

    level = floor(log2(min(size(image,[1 2]))));
    w_image = image(1:2^level, 1:2^level);    

    % set the wavelet type to haar
    wavename = 'haar';

    % use dwt2() to implement full 2D wavelet decomposition
    for j=level-1:-1:0

        % Select the coarse scale (subimage)
        Coarse = w_image(1:2^(j+1) , 1:2^(j+1));

        % apply dwt2 to coarse scale
        [cA,cH,cV,cD] = dwt2(Coarse, wavename);

        % Build-up the wavelet component according to Figure 1 in labwork
        % cA->T_phi, cH->T^H_psi, cV->T^V_psi, cD->T^D_psi
        wcomp = [cA,cH; cV,cD];

        % Substitute wavelet component into coarse scale
        w_image(1:2^(j+1),1:2^(j+1)) = wcomp;

    end
end