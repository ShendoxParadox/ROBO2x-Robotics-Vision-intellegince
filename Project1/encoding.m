function LC = encoding(L, bins)

    % Input:
    % L: the Laplacian pyramid of the input image
    % bins: The number of bins used for discretization of each pyramid level
    % Output:
    % LC: the quantized version of the image stored in the Laplacian pyramid
    
    % Please follow the instructions to fill in the missing commands.

    depth = numel(bins);
    LC = cell(1,depth);
    
    for i = 1:depth

        % 1) Compute the edges of the bins we will use for discretization
        % (MATLAB command: linspace)
        % For level i, the linspace command will give you a row vector 
        % with bins(i) linearly spaced points between [X1,X2].
        % Remember that the range [X1,X2] depends on the level of the 
        % pyramid. The difference images (levels 1 to depth-1) are in 
        % the range of [-128,128], while the blurred image is in the 
        % range of [0,256]
        if i == depth % blurred image in range [0, 256]
            edges = linspace(0, 256, bins(i));
        else % difference image in range [-128,128]
            edges = linspace(-128, 128, bins(i));
        end
        
        % 2) Compute the centers that correspond to the above edges
        % The 1st center -> (1st edge + 2nd edge)/2
        % The 2nd center -> (2nd edge + 3rd edge)/2 and so on
        centers = (edges(1:numel(edges)-1) + edges(2:numel(edges))) / 2;
        
        % 3) Discretize the values of the image at this level of the
        % pyramid according to edges (MATLAB command: discretize)
        % Hint: use 'centers' as the third argument of the discretize
        % command to get the value of each pixel instead of the bin index.
        LC{i} = discretize(L{i}, edges, centers);
        
    end
    
end