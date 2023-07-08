% Parameters
scale = 2; % Resizing factor

% Input filename
filename = input('Enter the filename of the image: ', 's');

% Read the original image
originalImage = imread(filename);
originalImage = im2double(originalImage);

% Upscaling using bicubic interpolation
upscaledImage = imresize(originalImage, scale, 'bicubic');

% Display the original and upscaled images
figure;
subplot(1, 4, 1);
imshow(originalImage);
title('Original Image');
subplot(1, 4, 2);
imshow(upscaledImage);
title('Upscaled Image');

% Save the upscaled image
upscaledFilename = 'upscaled_image.jpg';
imwrite(upscaledImage, upscaledFilename);

% Display the sizes of the images
originalSize = size(originalImage);
upscaledSize = size(upscaledImage);

fprintf('Original Image Size: %d x %d\n', originalSize(1), originalSize(2));
fprintf('Upscaled Image Size: %d x %d\n', upscaledSize(1), upscaledSize(2));
