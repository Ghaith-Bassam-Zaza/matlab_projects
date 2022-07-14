function fh = get_polynomial_handle(p)
    function polynomial = poly(x)
        polynomial = add(0,1);
        function polynomial = add(polynomial,ii)
            polynomial = polynomial + p(ii) .* x.^(ii-1);
            if ii ~= length(p)
                polynomial = add(polynomial,(ii+1));
            else
                return;
            end
        end    
    end
    fh = @poly;
end
