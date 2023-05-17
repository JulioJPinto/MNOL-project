% Input filename
filename = input('Enter the filename of the image: ', 's');

% Read the original image
originalImage = imread(filename);

% Parameters
sigma = 2;             % Standard deviation of the Gaussian filter
scale = 2;             % Upscaling factor
neighborhoodSize = 3;  % Size of the median filter neighborhood
iterations = 2;        % Number of iterations for the median filter

% Convert image to double
originalImage = im2double(originalImage);

% Upscaling using bicubic interpolation
upscaledImage = imresize(originalImage, scale, 'bicubic');

% Create Gaussian filter
filterSize = 2 * ceil(3 * sigma) + 1;
gaussianFilter = fspecial('gaussian', filterSize, sigma);

% Apply smoothing using Gaussian filter
smoothedImage = imfilter(upscaledImage, gaussianFilter);

% Apply median filter with custom neighborhood size and iterations
medianFiltered = smoothedImage;
for k = 1:iterations
    medianFiltered = medfilt2(medianFiltered, [neighborhoodSize neighborhoodSize]);
end

% Display the original, upscaled, smoothed, and filtered images
figure;
subplot(1, 4, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 4, 2);
imshow(upscaledImage);
title('Upscaled Image');
subplot(1, 4, 3);
imshow(smoothedImage);
title('Smoothed Image');
subplot(1, 4, 4);
imshow(medianFiltered);
title('Median Filtered Image');

% Save the upscaled image
upscaledFilename = 'upscaled_image.jpg';
imwrite(upscaledImage, upscaledFilename);

% Save the smoothed image
smoothedFilename = 'smoothed_image.jpg';
imwrite(smoothedImage, smoothedFilename);

% Save the median filtered image
filteredFilename = 'median_filtered_image.jpg';
imwrite(medianFiltered, filteredFilename);

% Display the sizes of the images
originalSize = size(originalImage);
upscaledSize = size(upscaledImage);
smoothedSize = size(smoothedImage);
filteredSize = size(medianFiltered);

fprintf('Original Image Size: %d x %d\n', originalSize(1), originalSize(2));
fprintf('Upscaled Image Size: %d x %d\n', upscaledSize(1), upscaledSize(2));
fprintf('Smoothed Image Size: %d x %d\n', smoothedSize(1), smoothedSize(2));
fprintf('Median Filtered Image Size: %d x %d\n', filteredSize(1), filteredSize(2));
