function Q = Q_ssim(A, B, F)

    A = cast(A, 'double');
    B = cast(B, 'double');
    F = cast(F, 'double');

    % Get the size of the image
    [height, width] = size(image);

    % Define the size of the square region
    squareSize = 7;

    Q = 0;
    count = 0;

    % Iterate over each square region
    for i = 1:squareSize:height
        for j = 1:squareSize:width
            % Extract the 7x7 square region
            Aw = A(i:i+squareSize-1, j:j+squareSize-1);
            Bw = B(i:i+squareSize-1, j:j+squareSize-1);
            Fw = F(i:i+squareSize-1, j:j+squareSize-1);
            
            [SSIM_af, map_af] = ssim(Aw, Fw);
            [SSIM_bf, map_bf] = ssim(Bw, Fw);
            [SSIM_ab, map_ab] = ssim(Aw, Bw);

            if SSIM_ab>=0.75
                s_Aw = var(Aw(:));
                s_Bw = var(Bw(:));
                Lw = s_Aw / (s_Aw + s_Bw);
                Q = Q + Lw*SSIM_af + (1-Lw)*SSIM_bf;
            else
                Q = Q + max(SSIM_af, SSIM_bf);
            end
            count = count + 1;
        end
    end
    Q = Q / count;
end