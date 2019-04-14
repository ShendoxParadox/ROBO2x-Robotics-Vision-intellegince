I = imread('girl.jpg');
size(I)
imshow(I);
I = imresize(I, [512, 512]);
figure;
imshow(I);