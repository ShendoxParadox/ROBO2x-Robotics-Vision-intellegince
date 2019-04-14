%% Image Approximation
% load a grayscale image and set its resolution to 200x200 pixels
I = imread('cameraman.tif');
I = im2double(imresize(I,[200 200]));

%% PART 1: Visualize 2D Fourier transform
% compute and visualize the 2D Fourier Transform of the image
F = fft_vis(I);
figure(1), imshow(F,[]), colormap(jet(64)), colorbar;

%% PART 2: Compression
% compute the compressed version of the image in the Fourier domain
% using M coefficients
[rows,cols] = size(I);
n_0 = rows*cols;
M = n_0/8;
Fcomp = compress(I,sqrt(M));

%% PART 3: Decompression
% compute the image approximation by applying the inverse transformation
Id = decompress(Fcomp);

% visualize the original image and the approximation
figure(2);
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Id);

%% PART 4: Signal-to-Noise Ratio
% compute the signal-to-noise ratio for different approximations
figure(3);
M = n_0./2.^(2:9);
for i = 1:8
    Fcomp = compress(I,sqrt(M(i)));
    Id = decompress(Fcomp);
    SNR(i) = compute_snr(I,Id);
    subplot(2,4,i);
    imshow(Id);
    xlabel(['\surd{M} = ' num2str(sqrt(M(i)))]);
end
figure(4);plot(sqrt(M), SNR );xlabel('\surd{M}'); ylabel('SNR');

%% PART S: Compression Ratio
% compute the compression ratio for different approximations
M = n_0./2.^(2:9);
for i = 1:8
    Fcomp = compress(I,sqrt(M(i)));
    Id = decompress(Fcomp);
    CR(i) = compute_cr(I,M(i));
end
figure(5);plot(sqrt(M), CR );xlabel('\surd{M}'); ylabel('CR');
