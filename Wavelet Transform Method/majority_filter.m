function filtered_map = majority_filter(binary_map)
    
    filter_size = 3;
    pad_size = floor(filter_size/2);
    kernel = ones(filter_size, filter_size);
    padded_map = padarray(double(binary_map), [pad_size pad_size], 0.5, 'both');

    count = conv2(padded_map, kernel, 'same');
    filtered_map = binary_map;
    
    % Loop over each pixel in the binary map
    for i = 1:size(binary_map, 1)
        for j = 1:size(binary_map, 2)
            % If the center pixel is from image A and the majority of the
            % surrounding pixels are from image B, switch the center pixel
            % to image B
            if binary_map(i, j) == 1 && count(i+pad_size, j+pad_size) <= filter_size^2/2
                filtered_map(i, j) = 0;
            % If the center pixel is from image B and the majority of the
            % surrounding pixels are from image A, switch the center pixel
            % to image A
            elseif binary_map(i, j) == 0 && count(i+pad_size, j+pad_size) >= filter_size^2/2
                filtered_map(i, j) = 1;
            end
        end
    end

end