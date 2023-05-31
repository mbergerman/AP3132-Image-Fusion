debug = false;

n = 5;
Q_nmi_wt = zeros(n, 1);
Q_nmi_gf = zeros(n, 1);
Q_nmi_wfusimg = zeros(n, 1);
Q_ssim_wt = zeros(n, 1);
Q_ssim_gf = zeros(n, 1);
Q_ssim_wfusimg = zeros(n, 1);

for i = 1:n
    image_a = rgb2gray(imread(sprintf('../data/input/lytro_%02d/lytro_%02d_A.jpg', i, i)));
    image_b = rgb2gray(imread(sprintf('../data/input/lytro_%02d/lytro_%02d_B.jpg', i, i)));
    image_a = crop_pow2(image_a);
    image_b = crop_pow2(image_b);

    fused_wt = cast(wt_fusion(image_a, image_b), "uint8");
    fused_gf = cast(gf_fusion(image_a, image_b), "uint8");
    
    wv = 'haar';
    lv = floor(log2(min(size(image_a,[1 2]))));
    fused_wfusimg = cast(wfusimg(image_a, image_b, wv, lv, 'mean', 'mean'), "uint8");
    
    Q_nmi_wt(i) = Q_nmi(image_a, image_b, fused_wt);
    Q_nmi_gf(i) = Q_nmi(image_a, image_b, fused_gf);
    Q_nmi_wfusimg(i) = Q_nmi(image_a, image_b, fused_wfusimg);
    
    Q_ssim_wt(i) = Q_ssim(image_a, image_b, fused_wt);
%     Q_ssim_gf(i) = Q_ssim(image_a, image_b, fused_gf);
%     Q_ssim_wfusimg(i) = Q_ssim(image_a, image_b, fused_wfusimg);
    
    if debug
        figure('Position', [80 80 1200 600]);
        subplot(1, 2, 1);
        imshow(image_a);
        title('Image 1');

        subplot(1, 2, 2);
        imshow(image_b);
        title('Image 2');

        figure('Position', [80 80 1400 600]);

        subplot(1, 3, 1);
        imshow(im2double(fused_wt));
        title('Fused image: Wavelet Transform');

        subplot(1, 3, 2);
        imshow(fused_gf);
        title('Fused image: Guided Filter');

        subplot(1, 3, 3);
        imshow(fused_matlab);
        title('Fused image: Matlab wfusimg');
    end
end

%%
quality_nmi = [mean(Q_nmi_wt), mean(Q_nmi_gf), mean(Q_nmi_wfusimg)];
quality_ssim = [mean(Q_ssim_wt), mean(Q_ssim_gf), mean(Q_ssim_wfusimg)];

figure('Position', [80 80 1400 500])
bar([quality_nmi ; quality_ssim]);
