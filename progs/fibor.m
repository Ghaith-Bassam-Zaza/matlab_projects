function f = fibor(n)
    if n == 1
        f(n) = 1;
    elseif n == 2
        f(n) = 1;
        f(n-1) = 1;
    else
        f(1:n-1) = fibor(n-1);
        f(n)=f(n-1)+f(n-2);
    end
end
