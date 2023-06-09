function O = guided_filter(P, I, r, eps)

    w = 2*r+1;
    
    avg_kernel = fspecial('average',[w, w]);
    mu = imfilter(I, avg_kernel, 'symmetric', 'conv');
    delta = stdfilt(I, ones(w, w)) .^ 2;
    Pw_mean = imfilter(P, avg_kernel, 'symmetric', 'conv');
    I_times_P_avg = imfilter(I.*P, avg_kernel, 'symmetric', 'conv');
    
    %dipshow(I_times_P_avg, 'lin');
    %dipshow(mu.*Pw_mean, 'lin');
    
    a = (I_times_P_avg - mu.*Pw_mean) ./ (delta + eps);
    b = Pw_mean - a.*mu;
    
    a_mean = imfilter(a, avg_kernel, 'symmetric', 'conv');
    b_mean = imfilter(b, avg_kernel, 'symmetric', 'conv');
    O = a_mean.*I + b_mean;

%     mu = zeros( size(I, 1)-w, size(I, 1)-w );
%     delta = zeros( size(I, 1)-w, size(I, 1)-w );
%     a = zeros( size(I, 1)-w, size(I, 1)-w );
%     b = zeros( size(I, 1)-w, size(I, 1)-w );    
%     O = zeros( size(I) );
%     O_count = zeros( size(I) );

%     for i = 1 : size(I, 1)-w
%         for j = 1 : size(I, 2)-w
%             Iw = I(i:i+w, j:j+w);
%             Pw = P(i:i+w, j:j+w);
%             %Pw_mean = mean(Pw, 'all');
%             
%             %mu(i, j) = mean( Iw , 'all');
%             %delta(i, j) = var( Iw , 0, 'all');
%             
%             a(i, j) = 1/w^2 * sum(Iw.*Pw - mu(i, j)*Pw_mean(i, j), 'all') / (delta(i, j)+eps);
%             b(i, j) = Pw_mean(i, j) - a(i, j)*mu(i, j);
%             
%             O(i:i+w, j:j+w) = O(i:i+w, j:j+w) + a(i, j)*Iw +b(i, j);
%             O_count(i:i+w, j:j+w) = O_count(i:i+w, j:j+w) + 1;
%         end
%     end
%     
%     O = O ./ O_count;

end