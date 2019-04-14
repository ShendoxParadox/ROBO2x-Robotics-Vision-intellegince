img = imread('square.jpg');
imshow(img);
img_gray = double(rgb2gray(img));

smooth = gauss_blurr(img_gray);
[I_x,I_y] = image_gradient(smooth);
figure;
imshow(I_x);
figure;
imshow(I_y);

I_xx = gauss_blurr(I_x.^2);
I_yy = gauss_blurr(I_y.^2);
I_xy = gauss_blurr(I_x .* I_y);
	
k = 0.06;
%% Use the corner score equation from the lecture. 
R = ((I_xx .* I_yy) - I_xy.^2) - (k * (I_xx + I_yy).^2);
figure;
imshow(R);


%r = 5;
%thresh = 10000;
%hc = nmsup(R,r,thresh);

%figure()
%imshow(img)
%hold on;
%plot(hc(:,1), hc(:,2), 'rx')
%hold off;

