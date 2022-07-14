classdef country
    %   represents countries and contains covid data for each
    
    properties
        name char
        index double
        states state
        states_names string
    end
    
    methods
        function obj = country(name,index)
            obj.name = name;
            obj.index = index;
        end
    end
end

