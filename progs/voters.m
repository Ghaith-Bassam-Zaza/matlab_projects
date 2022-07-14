function database = voters(database,varargin)
    len = length(database);
    
    cpy = database;
    
    for ii = 1:2:length(varargin)
        if ischar(varargin{ii}) || isstring(varargin{ii})
            len = len + 1;
            cpy(len).Name = string(varargin{ii});
            if ii+1 <= length(varargin) && isnumeric(varargin{ii+1}) && round(varargin{ii+1}) == varargin{ii+1}
                cpy(len).ID = varargin{ii+1};
            else
                return;
            end
        else
            return;
        end
    end
    database = cpy;
end