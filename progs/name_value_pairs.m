function db = name_value_pairs(varargin)
    if (isempty(varargin) || bitget(length(varargin),1)) 
        db = cell(0);
    else
        db = cell(length(varargin)/2,2);
        for i = 1:length(varargin)/2
            if isa(varargin{2*(i-1)+1},"char")
                db(i,1) = varargin(2*(i-1)+1);
                db(i,2) = varargin(2*(i-1)+2);
            else
                db = cell(0);
            end
        end
    end
end