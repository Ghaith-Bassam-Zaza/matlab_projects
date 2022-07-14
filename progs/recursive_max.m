function mx =recursive_max(v)

%this function returns the maximum value of a vector recursivly
if length(v) == 1
    mx = v(1);
else 
    if v(1) > v(2)
        v(2) = v(1);
    end
    mx = recursive_max(v(2:length(v)));
end
end



