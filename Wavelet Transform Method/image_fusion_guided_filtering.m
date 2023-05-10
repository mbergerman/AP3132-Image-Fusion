
%%
% implementation of Shutao Li (2013) doi: 10.1109/TIP.2013.2244222

I_1 = rgb2gray(im2mat(readim("data/input/lytro_01/lytro_01_A.jpg")));
I_2 = rgb2gray(im2mat(readim("data/input/lytro_01/lytro_01_B.jpg")));
I_1 = cast(I_1, "double");
I_2 = cast(I_2, "double");

dipshow(I_1)
title('Original Image 1')
dipshow(I_2);
title('Original Image 2')

%%
size_Z = 31;
Z = ones(size_Z, size_Z)/size_Z^2;
B_1 = imfilter(I_1,Z,'symmetric','conv');
B_2 = imfilter(I_2,Z,'symmetric','conv');
dipshow(B_1,'normal');
title('Base Layer 1')
dipshow(B_2,'normal');
title('Base Layer 2')

%%
D_1 = I_1 - B_1;
D_2 = I_2 - B_2;
dipshow(D_1,'lin')
title('Detail Layer 1')
dipshow(D_2,'lin')
title('Detail Layer 2')

%%
L = [0 1 0; 1 -4 1; 0 1 0];
H_1 = imfilter(I_1,L,'symmetric','conv');
H_2 = imfilter(I_2,L,'symmetric','conv');
dipshow(H_1,'lin');
dipshow(H_2,'lin');
% check different implementation laplacian, 
% https://nl.mathworks.com/help/images/ref/fspecial.html
% https://nl.mathworks.com/help/images/ref/locallapfilt.html

%%
r_g = 5;
s_g = 5;
g = fspecial('gaussian', [2*r_g+1,2*r_g+1], s_g);
S_1 = imfilter(abs(H_1),g,'symmetric','conv');
S_2 = imfilter(abs(H_2),g,'symmetric','conv');

dipshow(S_1,'lin');
title('Saliency map 1')
dipshow(S_2,'lin');
title('Saliency map 2')

%%
P_1 = S_1 >= S_2;
P_2 = S_1 <= S_2;
dipshow(P_1);
dipshow(P_2);

%%
W_B_1 = guided_filter(P_1, I_1, 15, 0.3);
W_B_2 = guided_filter(P_2, I_2, 15, 0.3);
W_D_1 = guided_filter(P_1, I_1, 10, 1e-6);
W_D_2 = guided_filter(P_2, I_2, 10, 1e-6);



W_B_exp = exp(W_B_1) + exp(W_B_2);
W_D_exp = exp(W_D_1) + exp(W_D_2);

W_B_1 = exp(W_B_1) ./ W_B_exp;
W_B_2 = exp(W_B_2) ./ W_B_exp;
W_D_1 = exp(W_D_1) ./ W_D_exp;
W_D_2 = exp(W_D_2) ./ W_D_exp;

dipshow(W_B_1, 'lin');
dipshow(W_B_2, 'lin');
dipshow(W_D_1, 'lin');
dipshow(W_D_2, 'lin');

%%
B_hat = W_B_1 .* B_1 + W_B_2 .* B_2;
D_hat = W_D_1 .* D_1 + W_D_2 .* D_2;
F = B_hat + D_hat;
dipshow(F);
