
%%
image_a = rgb2gray(im2mat(readim("data/input/lytro_01/lytro_01_A.jpg")));
image_b = rgb2gray(im2mat(readim("data/input/lytro_01/lytro_01_B.jpg")));
image_a = cast(image_a, "double");
image_b = cast(image_b, "double");

dipshow(image_a);
dipshow(image_b);

%%
fused_avg = (image_a + image_b)/2;
dipshow(fused_avg);
%%

wt_a = haar_wt(image_a);
wt_b = haar_wt(image_b);

bin_map = abs(wt_a) >= abs(wt_b);
bin_map_filtered = majority_filter(bin_map);

%dipshow(mat2im(bin_map));
%dipshow(mat2im(bin_map_filtered));

fused_wt_max = wt_b;
fused_wt_max(bin_map_filtered) = wt_a(bin_map_filtered);

dipshow(mat2im(wt_a), 'percentile');
dipshow(mat2im(wt_b), 'percentile');
dipshow(mat2im(fused_wt_max), 'percentile');

%%
dipshow(mat2im(haar_iwt(wt_a)));
dipshow(mat2im(haar_iwt(fused_wt_max)));

