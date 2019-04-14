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

    Id = abs(Id);
    
end