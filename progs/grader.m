function grade = grader(studentSol,RefSol,varargin)
    grade = true;
    for i = 1:length(varargin)
        if ~isequal(studentSol(varargin{i}),RefSol(varargin{i}))
            grade = false;
            break;
        end
    end
end