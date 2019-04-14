function ent = pyramident(LC)

    % Input:
    % LC: the quantized version of the images stored in the Laplacian pyramid
    % Output:
    % br: the bitrate for the image given the quantization
    
    % Please follow the instructions to fill in the missing commands.
    
    ent = 0;                % initialization of entropy
    [r, c] = size(LC{1});
    pixI = r*c;             % number of pixels in the original image
    
    for i = 1:numel(LC)
        
        % 1) Compute the number of pixels at this level of the pyramid
        [r, c] = size(LC{i});
        num_pix = r * c;
        
        % 2) Compute the entropy at this level of the pyramid 
        % (MATLAB command: entropy)
        entro = entropy(LC{i});
        
        % 3) Each level contributes to the entropy of the pyramid by a
        % factor that is equal to the sample density at this level, times
        % the entropy at this level. The sample density is computed as
        % (number of pixels at this level)/(number of pixels of original image).
        % Add this to the current sum of the entropy 'ent'
        sample_den = num_pix / pixI;
        ent = ent + (entro * sample_den);
        
    end
    
end