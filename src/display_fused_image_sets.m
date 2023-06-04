
imgs = config_images('../data/input');
num_imgs=length(imgs)/2;
n = num_imgs;

% Q_nmi_wt = zeros(n, 1);
% Q_nmi_gf = zeros(n, 1);
% Q_nmi_wfusimg = zeros(n, 1);
% Q_cvejic_wt = zeros(n, 1);
% Q_cvejic_gf = zeros(n, 1);
% Q_cvejic_wfusimg = zeros(n, 1);

for i = 1:n
    i_a = i*2-1;
    i_b = i*2;

    image_a = crop_pow2(rgb2gray(imread(imgs(i_a))));
    image_b = crop_pow2(rgb2gray(imread(imgs(i_b))));
    
    filename_wt = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_wt.png']);
    filename_gf = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_gf.png']);
    filename_wfusimg = fullfile('..', 'data', 'fused_images', ['image_' num2str(i) '_wfusimg.png']);
    
    fused_wt = imread(filename_wt);
    fused_gf = imread(filename_gf);
    fused_wfusimg = imread(filename_wfusimg);
    
%     Q_nmi_wt(i) = Q_nmi(image_a, image_b, fused_wt);
%     Q_nmi_gf(i) = Q_nmi(image_a, image_b, fused_gf);
%     Q_nmi_wfusimg(i) = Q_nmi(image_a, image_b, fused_wfusimg);
%     
%     Q_cvejic_wt(i) = metricsQc(image_a, image_b, fused_wt);
%     Q_cvejic_gf(i) = metricsQc(image_a, image_b, fused_gf);
%     Q_cvejic_wfusimg(i) = metricsQc(image_a, image_b, fused_wfusimg);

    set(0,'defaultfigurecolor','w') %sets background all following figures to white instead of grey
    %figure('Position', [80 80 1200 600]);
    figure;
    %uses ' Controllable tight subplot ' add-on for thighter subplots
    margins = [0.00,0.02];

    subplot_tight(2, 3, 1.5, margins);
    imshow(image_a);
    title('Image 1');

    subplot_tight(2, 3, 2.5, margins);
    imshow(image_b);
    title('Image 2');

    subplot_tight(2, 3, 4, margins);
    imshow(im2double(fused_wt));
    title('Wavelet Transform');

    subplot_tight(2, 3, 5, margins);
    imshow(fused_gf);
    title('Guided Filter');

    subplot_tight(2, 3, 6, margins);
    imshow(fused_wfusimg);
    title('Matlab wfusimg');
    
    filename = fullfile('..', 'figures', 'fused_sets', ['fused_set_' num2str(i) '.png']);
    exportgraphics(gcf,filename,'Resolution',300)

end

