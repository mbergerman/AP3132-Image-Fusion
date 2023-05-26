function croppedImage = crop_pow2(image)
    % Determine the desired size for the cropped image
    desiredSize = 2^floor(log2(min(size(image))));

    % Calculate the crop boundaries
    centerRow = size(image, 1) / 2;
    centerCol = size(image, 2) / 2;
    startRow = round(centerRow - desiredSize/2) + 1;
    endRow = startRow + desiredSize - 1;
    startCol = round(centerCol - desiredSize/2) + 1;
    endCol = startCol + desiredSize - 1;

    % Perform the crop operation
    croppedImage = image(startRow:endRow, startCol:endCol, :);
end