debug = false;

imgs = config_images('../data/input');
num_imgs=length(imgs)/2;
n = num_imgs;

Q_nmi_wt = zeros(n, 1);
Q_nmi_gf = zeros(n, 1);
Q_nmi_wfusimg = zeros(n, 1);
Q_cvejic_wt = zeros(n, 1);
Q_cvejic_gf = zeros(n, 1);
Q_cvejic_wfusimg = zeros(n, 1);

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
    
    Q_nmi_wt(i) = Q_nmi(image_a, image_b, fused_wt);
    Q_nmi_gf(i) = Q_nmi(image_a, image_b, fused_gf);
    Q_nmi_wfusimg(i) = Q_nmi(image_a, image_b, fused_wfusimg);
    
    Q_cvejic_wt(i) = metricsQc(image_a, image_b, fused_wt);
    Q_cvejic_gf(i) = metricsQc(image_a, image_b, fused_gf);
    Q_cvejic_wfusimg(i) = metricsQc(image_a, image_b, fused_wfusimg);

end


%%
combinedMatrix = horzcat(Q_nmi_gf, Q_nmi_wt, Q_nmi_wfusimg);
sortedMatrix = sortrows(combinedMatrix, 1);
Q_nmi_gf = sortedMatrix(:, 1);
Q_nmi_wt = sortedMatrix(:, 2);
Q_nmi_wfusimg = sortedMatrix(:, 3);

combinedMatrix = horzcat(Q_cvejic_gf, Q_cvejic_wt, Q_cvejic_wfusimg);
sortedMatrix = sortrows(combinedMatrix, 1);
Q_cvejic_gf = sortedMatrix(:, 1);
Q_cvejic_wt = sortedMatrix(:, 2);
Q_cvejic_wfusimg = sortedMatrix(:, 3);

figure;
plot(1:n, Q_nmi_wt, 'r', 1:n, Q_nmi_gf, 'g', 1:n, Q_nmi_wfusimg, 'b');
legend('Wavelet Transform', 'Guided Filtering', 'Matlab wfusimg');

figure;
plot(1:n, Q_cvejic_wt, 'r', 1:n, Q_cvejic_gf, 'g', 1:n, Q_cvejic_wfusimg, 'b');
legend('Wavelet Transform', 'Guided Filtering', 'Matlab wfusimg');

%%
quality_nmi = [mean(Q_nmi_wt), mean(Q_nmi_gf), mean(Q_nmi_wfusimg)];
quality_cvejic = [mean(Q_cvejic_wt), mean(Q_cvejic_gf), mean(Q_cvejic_wfusimg)];
% 
figure('Position', [80 80 1400 500]);
bar([quality_nmi ; quality_cvejic]);
