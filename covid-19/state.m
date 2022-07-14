classdef state  
    %   represents states and contains covid data for each
    
    properties
        name char
        index double
        
    end
    
    methods
        function obj = state(name,index)
            obj.name = name;
            obj.index = index;
        end    
        function plot_cases_com(obj,ax,covid_data,avgD)
            %   plotes the comulative curve of cases as bars
            cd_vectors = covid_data(obj.index,3:end);
            cases = zeros(1,size(covid_data,2)-2);
           
            for i=1:size(covid_data,2)-2
                a=cd_vectors{i};
                cases(i) = a(1);
               
            end
            cases=movmean(cases,avgD);
            bar(ax,cases,'b');
            
        end
        
        function plot_deathes_com(obj,ax,covid_data,avgD)
            %   plotes the comulative curve of deathes as line
            cd_vectors = covid_data(obj.index,3:end);
            
            deathes = zeros(1,size(covid_data,2)-2);
            for i=1:size(covid_data,2)-2
                a=cd_vectors{i};
               
                deathes(i) = a(2);
            end
            deathes= movmean(deathes,avgD);
            plot(ax,deathes,'r');
            
        end
        function plot_cases(obj,ax,covid_data,avgD)
            %   plotes the curve of cases as bars
            cd_vectors = covid_data(obj.index,3:end);
            cases = zeros(1,size(covid_data,2)-2);
            cases_com = zeros(1,size(covid_data,2)-2);
            for i=1:size(covid_data,2)-2
                a=cd_vectors{i};
                cases_com(i) = a(1);
               
                if i > 1 
                    cases(i) = cases_com(i) - cases_com(i-1);
                    if cases(i)<0
                        cases(i) = 0;
                    end
                else
                    cases(i) = cases_com(i);
                end
            end
            cases = movmean(cases,avgD);
            bar(ax,cases,'b');
        end
        
        function plot_deathes(obj,ax,covid_data,avgD)
            %   plotes the curve of deathes as line
            cd_vectors = covid_data(obj.index,3:end);
            
            deathes_com = zeros(1,size(covid_data,2)-2);
            deathes = zeros(1,size(covid_data,2)-2);
            for i=1:size(covid_data,2)-2
                a=cd_vectors{i};
               
                deathes_com(i) = a(2);
                if i > 1 
                    deathes(i) = deathes_com(i) - deathes_com(i-1);
                    if deathes(i)<0
                        deathes(i) = 0;
                    end
                else
                    deathes(i) = deathes_com(i);
                end
            end
            deathes = movmean(deathes,avgD);
            plot(ax,deathes,'r');
        end
    end
end

