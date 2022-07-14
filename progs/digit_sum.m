function sum = digit_sum(input)

%this function gets the sum of the input decimal digits
if ~isscalar(input) || input ~= fix(input) || input < 0
        error('non-negative integer scalar input expected');
end

if input == 0
    sum = 0;
else
    reminder = rem(input,10);
   sum = reminder + digit_sum(fix(input/10));
end
end
