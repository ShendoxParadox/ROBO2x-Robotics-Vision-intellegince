function loc = nmsup(R,r,thresh)
    %% Step 1-2 must be performed in a way that allows you to 
    %% preserve location information for each corner.
    [sy,sx] = size(R);
    [x,y] = meshgrid(1:sx,1:sy);
    
    %% Step 1: eliminate values below the specified threshold.

    
    %% Step 2: Sort the remaining values in decreasing order.


    %% Step 3: Starting with the highest scoring corner value, if 
    %% there are corners within its r neighborhood remove 
    %% them since their scores are lower than that of the corner currently 
    %% considered. This is true since the corners are sorted 
    %% according to their score and in decreasing order.

    
    %% The variable loc should contain the sorted corner locations which
    %% survive thresholding and non-maximum suppression with
    %% size(loc): nx2
    %% loc(:,1): x location
    %% loc(:,2): y location
    loc = 
end