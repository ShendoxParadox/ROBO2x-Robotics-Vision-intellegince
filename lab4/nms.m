img = imread('peppers.png');
img_gray = double(rgb2gray(img));

img_gray_smooth = gauss_blur(img_gray);
[I_x,I_y] = grad2d(img_gray_smooth);

I_xx = gauss_blur(I_x.^2);
I_yy = gauss_blur(I_y.^2);
I_xy = gauss_blur(I_x .* I_y);
	
k = 0.06;
%% Use the corner score equation from the lecture. 
R = ((I_xx .* I_yy) - I_xy.^2) - (k * (I_xx + I_yy).^2);

r = 5;
thresh = 10000;
hc = nmsup(R,r,thresh);

figure()
imshow(img)
hold on;
plot(hc(:,1), hc(:,2), 'rx')
hold off;

function loc = nmsup(R,r,thresh)
    %% Step 1-2 must be performed in a way that allows you to 
    %% preserve location information for each corner.
    [sy,sx] = size(R);
    [x,y] = meshgrid(1:sx,1:sy);
    
    %% Step 1: eliminate values below the specified threshold.
    x_x = x(x>=thresh);
    y_y = y(y>=thresh);
    
    %% Step 2: Sort the remaining values in decreasing order.
    x_x = sort(x_x, 'descend');
    y_y = sort(y_y, 'descend');

    %% Step 3: Starting with the highest scoring corner value, if 
    %% there are corners within its r neighborhood remove 
    %% them since their scores are lower than that of the corner currently 
    %% considered. This is true since the corners are sorted 
    %% according to their score and in decreasing order.

    
    %% The variable loc should contain the sorted corner locations which
    %% survive thresholding and non-maximum suppression with
    %% size(loc): nx2
    %% loc(:,1): x location
    %% loc(:,2): y location
    loc = 
end
 
function [I_x,I_y] = grad2d(img)
	%% compute image gradients in the x direction
	%% convolve the image with the derivative filter from the lecture
	%% using the conv2 function and the 'same' option
	dx_filter = [0.5 0 -0.5];
	I_x = conv2(img, dx_filter, 'same');

	%% compute image gradients in the y direction
	%% convolve the image with the derivative filter from the lecture
	%% using the conv2 function and the 'same' option
	dy_filter = [0.5; 0; -0.5];
	I_y = conv2(img, dy_filter, 'same');
end

function smooth = gauss_blur(img)
    %% Since the Gaussian filter is separable in x and y we can perform Gaussian smoothing by
    %% convolving the input image with a 1D Gaussian filter in the x direction then  
    %% convolving the output of this operation with the same 1D Gaussian filter in the y direction.

    %% Gaussian filter of size 5
    %% the Gaussian function is defined f(x) = 1/(sqrt(2*pi)*sigma)*exp(-x.^2/(2*sigma^2))
    x =  -2:2;
    sigma = 1;
    gauss_filter = 1/(sqrt(2*pi)*sigma)*exp(-x.^2/(2*sigma^2));

    %% using the conv2 function and the 'same' option
    %% convolve the input image with the Gaussian filter in the x
    smooth_x = conv2(img, gauss_filter,'same');
    %% convolve smooth_x with the transpose of the Gaussian filter
    smooth = conv2(smooth_x, gauss_filter','same');
end