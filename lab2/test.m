I = imread('cameraman.tif');
I = im2double(imresize(I,[200 200]));
[rows,cols] = size(I);
n_0 = rows*cols;
M = n_0/8;
Fcomp = compress(I,sqrt(M));

Id = decompress(Fcomp);

figure(2);
subplot(1,2,1);
imshow(I);
subplot(1,2,2);
imshow(Id);

function [Id] = decompress(Fcomp)

    % Input:
    % F: the compressed version of the image
    % Output:
    % Id: the approximated image

    % Please follow the instructions in the comments to fill in the missing commands.    
    
    % 1) Apply the inverse FFT shift (MATLAB command ifftshift)

    Id = ifftshift(Fcomp);
    
    % 2) Compute the inverse FFT (MATLAB command ifft2)

    Id = ifft2(Id);
    
    % 3) Keep the real part of the previous output

    Id = real(Id);

end

function [Fcomp] = compress(I,M_root)

    % Copy this function from the previous step
     % Input:
    % I: the input image
    % M_root: square root of the number of coefficients we will keep
    % Output:
    % Fcomp: the compressed version of the image

    % Please follow the instructions in the comments to fill in the missing commands.    
    
    % 1) Perform the FFT transform on the image (MATLAB command fft2).
    F = fft2(I);
    % 2) Shift zero-frequency component to center of spectrum (MATLAB command fftshift).

    F = fftshift(F);
    % We create a mask that is the same size as the image. The mask is zero everywhere, 
    % except for a square with sides of length M_root centered at the center of the image.
    [rows,cols] = size(I);
    idx_rows = abs((1:rows) - ceil(rows/2)) < M_root/2 ; 
    idx_cols = abs((1:cols)- ceil(cols/2)) < M_root/2 ; 
    M = (double(idx_rows')) * (double(idx_cols));
    
    % 3) Multiply in a pointwise manner the image with the mask.  
    Fcomp = F .* M;
end