function H = compute_homography(p1,p2)		
    % use SVD to solve for H as was done in the lecture
    f = p1;
    p1 = p2;
    p2 = f;

    A = [-p1(1,1) -p1(1,2) -1 0 0 0 p1(1,1)*p2(1,1) p1(1,2)*p2(1,1) p2(1,1)
        0 0 0 -p1(1,1) -p1(1,2) -1 p1(1,1)*p2(1,2) p1(1,2)*p2(1,2) p2(1,2)
        -p1(2,1) -p1(2,2) -1 0 0 0 p1(2,1)*p2(2,1) p1(2,2)*p2(2,1) p2(2,1)
        0 0 0 -p1(2,1) -p1(2,2) -1 p1(2,1)*p2(2,2) p1(2,2)*p2(2,2) p2(2,2)
        -p1(3,1) -p1(3,2) -1 0 0 0 p1(3,1)*p2(3,1) p1(3,2)*p2(3,1) p2(3,1)
        0 0 0 -p1(3,1) -p1(3,2) -1 p1(3,1)*p2(3,2) p1(3,2)*p2(3,2) p2(3,2)
        -p1(4,1) -p1(4,2) -1 0 0 0 p1(4,1)*p2(4,1) p1(4,2)*p2(4,1) p2(4,1)
        0 0 0 -p1(4,1) -p1(4,2) -1 p1(4,1)*p2(4,2) p1(4,2)*p2(4,2) p2(4,2)];
    
    [u, d, v] = svd(A);
    x = v(:,end)./v(end,end);
    H = reshape(x,3,3);
    
end

