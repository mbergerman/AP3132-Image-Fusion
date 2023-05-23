
for i = 1:5
    image_a = rgb2gray(imread("../data/input/lytro_0" + i + "/lytro_0" + i + "_A.jpg"));
    image_b = rgb2gray(imread("../data/input/lytro_0" + i + "/lytro_0" + i + "_B.jpg"));
    
    fused_wt = cast(wt_fusion(image_a, image_b), "uint8");
    fused_gf = cast(gf_fusion(image_a, image_b), "uint8");
    
    figure('Position', [80 80 800 700]);
    subplot(2, 2, 1);
    imshow(image_a);
    title('Image 1');
    
    subplot(2, 2, 2);
    imshow(image_b);
    title('Image 2');
    
    subplot(2, 2, 3);
    imshow(im2double(fused_wt));
    title('Fused image: Wavelet Transform');

    subplot(2, 2, 4);
    imshow(fused_gf);
    title('Fused image: Guided Filter');
end