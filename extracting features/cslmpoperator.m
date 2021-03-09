function [cslmpDescriptors, cslmpHistogram] = ...
    cslmpoperator(inputImage, R, N, T)

% Function to calculate CSLMP descriptors and Histogram.
%
% [cslmpDescriptors, cslmpHistogram] = cslmpoperator(inputImage, R, N, T)
% finds the CSLMP descriptors and histogram of the input image, for a
% specified circle radius R, equally spaced intervals N and threshold T.

% =========================================================================
%
%                  CENTER SYMMETRIC LOCAL Multilevel PATTERN
%
% =========================================================================
%
% Function Name : cslmpoperator
% Inputs
% inputImage --> Grayscale Image.
% R --> Radius of circle, default 1. Radius must be positive integer >= 1.
% N --> Number of Intervals, default 8. N must be positive even integer.
% T --> Threshold. Default [0.01, 0.1]. T elememts should be between
% 0 and 1. Number of Thresholds equal 2M+1. In this case M=2.
% Outputs
% cslmpDescriptors --> Binary vectors.
% cslmpHistogram  --> Histogram.
%
% =========================================================================


% =========================================================================
% Verifying the Inputs.
% =========================================================================

if(nargin == 1)
    T= [0.01, 0.1];
    N = 8;
    R = 1;
elseif(nargin == 2)
    T= [0.01, 0.1];
    N = 0.8;
elseif(nargin == 3)
    T= [0.01, 0.1];
end

if(R < 1 || round(R) ~= R)
    error('R must be a positive integer greater than or equal to 1.')
end

if(N < 2 || round(N) ~= N || mod(N,2))
    error('N must be a positive even integer.')
end

if(min(T) < 0 || max(T) > 1)
    error('T must be in the range 0 to 1.')
end

% =========================================================================
% Get size of the image.
% =========================================================================

[mRows, nColumns] = size(inputImage);

% =========================================================================
% Preallocation.
% =========================================================================

cslmpMatrix = zeros(mRows - 2*R, nColumns - 2*R);
cslmpHistogram = zeros(1,2*length(T)+1);

% =========================================================================
% Calculating CSLMP.
% =========================================================================
T=[-fliplr(T) 0 T];
x = round(cos(0: 2*pi/N :2*pi*(1 - 1/N)));
y = round(sin(0: 2*pi/N :2*pi*(1 - 1/N)));
img = double(inputImage);

for i = 1:N/2
    
    s = img(1+R-y(i):mRows-R-y(i),1+R+x(i):nColumns-R+x(i)) - ...
        img(1+R-y(i + N/2):mRows-R-y(i + N/2),1+R+x(i + N/2):nColumns-R+x(i+ N/2));
    
    cslmpMatrix(s <= 255*T(1)) = 1;%cslmpMatrix(s <= 255*T(1)) + 1;
    for j=2:length(T)
        cslmpMatrix(s > 255*T(j-1) & s < 255*T(j)) = j;%cslmpMatrix(s > 255*T(j-1) & s < 255*T(j)) + j;
    end
    cslmpMatrix(s > 255*T(j)) = j+1;%cslmpMatrix(s >= 255*T(j)) + j+1 ;
    for h = 1:length(T)+1
        cslmpHistogram(i,h) = sum(sum(cslmpMatrix == h));
    end
    %
end
cslmpDescriptors = cslmpHistogram(:);
end

% =========================================================================


