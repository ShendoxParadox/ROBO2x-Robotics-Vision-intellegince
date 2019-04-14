I = imread('cameraman.tif');
I = im2double(imresize(I,[200 200]));
[rows,cols] = size(I);
n_0 = rows*cols;
M = n_0/8;
Fcomp = compress(I,sqrt(M));

Id = decompress(Fcomp);


imshow(I);
figure;
imshow(Id);