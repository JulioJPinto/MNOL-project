% Parameters
scale = 2; % Smoothing factor

% Input filename
filename = input('Enter the filename of the image: ', 's');

% Read the original image
originalImage = imread(filename);
originalImage = im2double(originalImage);

smoothedImage = zeros(size(originalImage));

for c = 1:size(originalImage, 3)
    for i = 1:size(originalImage, 1)
        for j = 1:size(originalImage, 2)
            patch = originalImage( ...
              max(1,i-scale):min(end,i+scale), ...
              max(1,j-scale):min(end,j+scale), ...
              c);
              
            smoothedPatch = trapz(trapz(patch, 1), 2) / numel(patch);
            smoothedImage(i, j, c) = smoothedPatch;
        end
    end
end

% Display the original and smoothed images
figure;
subplot(1, 4, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 4, 2);
imshow(smoothedImage);
title('Smoothed Image');

% Save the smoothed image
smoothedFilename = 'smoothed_image.jpg';
imwrite(smoothedImage, smoothedFilename);

% Display the sizes of the images
originalSize = size(originalImage);
smoothedSize = size(smoothedImage);

fprintf('Original Image Size: %d x %d\n', originalSize(1), originalSize(2));
fprintf('Smoothed Image Size: %d x %d\n', smoothedSize(1), smoothedSize(2));
