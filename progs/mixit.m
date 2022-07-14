function A = mixit(tracks, weights)
    if size(tracks,2) ~= length(weights)
        A = [];
    else
        tracks = 2*double(tracks)/65535-1;
        weights = double(weights(:));
        A = tracks * weights;
        if max(abs(A)) > 1  
            A = A / max(abs(A));
        end
    end
end