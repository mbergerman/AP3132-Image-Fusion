function filtered_map = majority_filter(binary_map)
    
    filter_size = 3;
    pad_size = floor(filter_size/2);
    kernel = ones(filter_size, filter_size);
    count = imfilter(binary_map, kernel, 0.5);
    
    % Removes all equal/undesided cases
    filtered_map = logical(binary_map);
    
    % Flip center pixel if majority of surrouding is from other image 
    flip_to_b = binary_map & count < filter_size^2/2;
    filtered_map(flip_to_b) = false;
    flip_to_a = ~binary_map & count > filter_size^2/2;
    filtered_map(flip_to_a) = true;

end