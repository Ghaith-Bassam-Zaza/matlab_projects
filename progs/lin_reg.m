function [a,b] = lin_reg(x,y)
    A = [x; ones(1,length(x))]';
    B = y';
    line = A\B;
    a = line(1);
    b = line(2);
end