function [csltpDescriptors, csltpHistogram] = ...
                    csltpoperator(inputImage, R, N, T)

% Function to calculate CSLTP descriptors and Histogram.
%
% [csltpDescriptors, csltpHistogram] = csltpoperator(inputImage, R, N, T)
% finds the CSLTP descriptors and histogram of the input image, for a
% specified circle radius R, equally spaced intervals N and threshold T.

% =========================================================================
%
%                  CENTER SYMMETRIC LOCAL TERNARY PATTERN
%
% =========================================================================
%
% Function Name : csltpoperator
% Inputs 
% inputImage --> Grayscale Image.
% R --> Radius of circle, default 1. Radius must be positive integer >= 1.
% N --> Number of Intervals, default 8. N must be positive even integer.
% T --> Threshold. Default 0.2. T should be between 0 and 1.
% Outputs
% csltpDescriptors --> ternary vectors.
% csltpHistogram  --> Histogram.
%
% =========================================================================


% =========================================================================
% Verifying the Inputs.
% =========================================================================

if(nargin == 1)
    T = 0.2;
    N = 8;
    R = 1;
elseif(nargin == 2)
    T = 0.2;
    N = 0.8;
elseif(nargin == 3)
    T = 0.2;
end

if(R < 1 || round(R) ~= R)
    error('R must be a positive integer greater than or equal to 1.')
end
    
if(N < 2 || round(N) ~= N || mod(N,2))
    error('N must be a positive even integer.')
end

if(T < 0 || T > 1)
    error('T must be in the range 0 to 1.')
end

% =========================================================================
% Get size of the image.
% =========================================================================

[mRows, nColumns] = size(inputImage);

% =========================================================================
% Preallocation.
% =========================================================================

csltpMatrix = zeros(mRows - 2*R, nColumns - 2*R);
csltpHistogram = zeros(1,3^(N/2));

% =========================================================================
% Calculating CSLBP.
% =========================================================================

x = round(cos(0: 2*pi/N :2*pi*(1 - 1/N)));
y = round(sin(0: 2*pi/N :2*pi*(1 - 1/N)));
img = double(inputImage);

for i = 1:N/2
    
    s = img(1+R-y(i):mRows-R-y(i),1+R+x(i):nColumns-R+x(i)) - ...
        img(1+R-y(i + N/2):mRows-R-y(i + N/2),1+R+x(i + N/2):nColumns-R+x(i+ N/2));
    
    csltpMatrix(s >= 255*T) = csltpMatrix(s >= 255*T) + 2*3^(i-1);
    csltpMatrix(s > -255*T & s < 255*T) = csltpMatrix(s > -255*T & s < 255*T) + 3^(i-1);
    
end

for i = 0:3^(N/2) - 1
    csltpHistogram(i+1) = sum(sum(csltpMatrix == i));
end

csltpDescriptors = dec2base(csltpMatrix,3);


end

% =========================================================================
    