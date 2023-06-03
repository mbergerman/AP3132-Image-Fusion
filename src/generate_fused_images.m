debug = false;
%runtime multiple minutes, not measured more precisely yet

imgs = config_images('../data/input');
num_imgs=length(imgs)/2;
n = num_imgs;

for i = 1:n
    i_a = i*2-1;
    i_b = i*2;

    image_a = rgb2gray(imread(imgs(i_a)));
    image_b = rgb2gray(imread(imgs(i_b)));
    
    image_a = crop_pow2(image_a);
    image_b = crop_pow2(image_b);
   
    fused_wt = cast(wt_fusion(image_a, image_b), "uint8");
    fused_gf = cast(gf_fusion(image_a, image_b), "uint8");
    
    wv = 'haar';
    lv = floor(log2(min(size(image_a,[1 2]))));
    fused_wfusimg = cast(wfusimg(image_a, image_b, wv, lv, 'mean', 'mean'), "uint8");

    filename_wt = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_wt.png']);
    filename_gf = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_gf.png']);
    filename_wfusimg = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_wfusimg.png']);
    imwrite(fused_wt, filename_wt);
    imwrite(fused_gf, filename_gf);
    imwrite(fused_wfusimg, filename_wfusimg);
    
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
        imshow(fused_wfusimg);
        title('Fused image: Matlab wfusimg');
    end
end
