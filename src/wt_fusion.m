% implementation of Hui Li et al. (1994) doi: 10.1109/ICIP.1994.413273
function fused_image = wt_fusion(I_1, I_2, debug)

    if nargin < 3
        debug = false;
    end

    image_a = cast(I_1, "double");
    image_b = cast(I_2, "double");

    fused_avg = (image_a + image_b)/2;

    wt_a = haar_wt(image_a);
    wt_b = haar_wt(image_b);

    bin_map = abs(wt_a) >= abs(wt_b);
    bin_map_filtered = majority_filter(bin_map);

    fused_wt_max = wt_b;
    fused_wt_max(bin_map_filtered) = wt_a(bin_map_filtered);

    fused_image = haar_iwt(fused_wt_max);

    if debug
        dipshow(image_a);
        dipshow(image_b);
        dipshow(fused_avg);

        dipshow(mat2im(wt_a), 'percentile');
        dipshow(mat2im(wt_b), 'percentile');
        dipshow(mat2im(fused_wt_max), 'percentile');

        dipshow(mat2im(fused_image)); %should be 'normal' mapping/scaling
    end
end