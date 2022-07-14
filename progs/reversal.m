function w = reversal(v)
    if length(v) == 1 
        w = v(1);
    elseif length(v) == 2 
        w(1) = v(end);
        w(length(v)) = v(1);
    else
        w(1) = v(end);
        w(length(v)) = v(1);
        w(2:length(v)-1) = reversal(v(2:end-1));
    end
end