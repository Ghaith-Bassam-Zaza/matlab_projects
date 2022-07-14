function p = palindrome(txt)
    if length(txt) == 1
        p = true;
    else
        if txt(1) == txt(end)
            if length(txt) == 2
                p = true;
            else
                p = palindrome(txt(2:end-1));	
            end
        else
            p = false;
        end
    end
    
end