function [cslbpDescriptors, cslbpHistogram] = ...
                    cslbpoperator(inputImage, R, N, T)

% Function to calculate CSLBP descriptors and Histogram.
%
% [cslbpDescriptors, cslbpHistogram] = cslbpoperator(inputImage, R, N, T)
% finds the CSLBP descriptors and histogram of the input image, for a
% specified circle radius R, equally spaced intervals N and threshold T.

% =========================================================================
%
%                  CENTER SYMMETRIC LOCAL BINARY PATTERN
%
% =========================================================================
%
% Function Name : cslbpoperator
% Inputs 
% inputImage --> Grayscale Image.
% R --> Radius of circle, default 1. Radius must be positive integer >= 1.
% N --> Number of Intervals, default 8. N must be positive even integer.
% T --> Threshold. Default 0.2. T should be between 0 and 1.
% Outputs
% cslbpDescriptors --> Binary vectors.
% cslbpHistogram  --> Histogram.
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

cslbpMatrix = zeros(mRows - 2*R, nColumns - 2*R);
cslbpHistogram = zeros(1,2^(N/2));

% =========================================================================
% Calculating CSLBP.
% =========================================================================

x = round(cos(0: 2*pi/N :2*pi*(1 - 1/N)));
y = round(sin(0: 2*pi/N :2*pi*(1 - 1/N)));
img = double(inputImage);

for i = 1:N/2
    
    s = img(1+R-y(i):mRows-R-y(i),1+R+x(i):nColumns-R+x(i)) - ...
        img(1+R-y(i + N/2):mRows-R-y(i + N/2),1+R+x(i + N/2):nColumns-R+x(i+ N/2));
    
    cslbpMatrix(s >= 255*T) = cslbpMatrix(s >= 255*T) + 2^(i-1);
    
end

for i = 0:2^(N/2) - 1
    cslbpHistogram(i+1) = sum(sum(cslbpMatrix == i));
end

cslbpDescriptors = dec2bin(cslbpMatrix);


end

% =========================================================================
    

