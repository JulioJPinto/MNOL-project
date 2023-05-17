inputImage = imread(<image-path>);

k = 5; % Neighborhood
T = 10; %iteration

smoothingFunction = @(I, neighborhood) nonlinearSmoothing(I, neighborhood);

% Perform iterative smoothing
for t = 1:T
    % Apply smoothing function to each pixel in the image
    for i = 1:size(inputImage, 1)
        for j = 1:size(inputImage, 2)
            % Define the local neighborhood
            iMin = max(i - floor(k/2), 1);
            iMax = min(i + floor(k/2), size(inputImage, 1));
            jMin = max(j - floor(k/2), 1);
            jMax = min(j + floor(k/2), size(inputImage, 2));
            
            % Extract the local neighborhood
            neighborhood = inputImage(iMin:iMax, jMin:jMax);
            
            % Compute the smoothed intensity value using numerical integration
            smoothedValue = smoothingFunction(inputImage(i, j), neighborhood);
            
            % Update the smoothed image
            smoothedImage(i, j) = smoothedValue;
        end
    end
    
    % Update the input image for the next iteration
    inputImage = smoothedImage;
end

% Convert the smoothed image back to uint8 format for display and saving
smoothedImage = smoothedImage;

imwrite(smoothedImage, output-smoothed.png);

% Nonlinear Smoothing Function (Example: Median Filter)
function smoothedValue = nonlinearSmoothing(I, neighborhood)
    % Apply median filtering to the neighborhood
    neighborhood = neighborhood(:);
    sortedNeighborhood = sort(neighborhood);
    smoothedValue = median(sortedNeighborhood);
end