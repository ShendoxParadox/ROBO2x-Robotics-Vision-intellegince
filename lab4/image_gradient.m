
function [I_x,I_y] = image_gradient(img)
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