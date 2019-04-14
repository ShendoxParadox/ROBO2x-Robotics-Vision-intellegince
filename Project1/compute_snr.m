function snr = compute_snr(I, Id)

    % Input:
    % I: the original image
    % Id: the approximated (noisy) image
    % Output:
    % snr: signal-to-noise ratio
    
    % Please follow the instructions in the comments to fill in the missing commands.    

    % 1) Compute the noise image (original image minus the approximation)

    n_i = I - Id;
    
    % 2) Compute the Frobenius norm of the noise image
    
    n_i = norm(n_i,'fro');
    
    % 3) Compute the Frobenius norm of the original image
    
    In = norm(I,'fro');
    
    % 4) Compute SNR
    
    snr = (-20)*log10(n_i / In);

end