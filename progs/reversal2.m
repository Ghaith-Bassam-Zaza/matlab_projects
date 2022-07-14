function v = reversal2(v)
    if length(v) > 3
        v = [reversal(v(round(end/2):end)) reversal(v(1:round(end/2)-1))];
    elseif length(v) == 3 
        v = [v(end) v(2) v(1)];
    elseif length(v) == 2
        v = [v(end) v(1)];
    end
end
