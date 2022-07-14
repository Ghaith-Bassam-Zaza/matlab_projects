function clique = max_clique(graph,clique)
    if nargin < 2 % originaly we call the function
        clique = []; % hence, the clique is initiali
    end
    max_clq = clique; % max_clq will store the curren
    if isempty(clique) % when we first call the functi
        for ii = 1:length(graph) % we need to test potential cli
            clq = max_clique(graph,ii);
            if length(clq) > length(max_clq) % if the new one is larger than
                max_clq = clq; % we store the new one
            end
        end
    else
        for node = 1:length(graph) % we are in a recursive
            if isempty(find(node == clique, 1)) % unless it is already
                if check_clique(clique,node,graph) % if adding this node i
                    clq = max_clique(graph,[clique node]); % we call ourself with
                    if length(clq) > length(max_clq) % if what we get is la
                        max_clq = clq; % we store the new one
                    end
                end
            end
        end
    end
    clique = max_clq; % return the largest on
end

function ok = check_clique(clq,node,graph) % adding node to clq st
    ok = false;
    for ii = 1:length(clq) % for every current mem
        if isempty(find(clq(ii) == graph{node}, 1)) || ... % the member must be on
            isempty(find(node == graph{clq(ii)}, 1)) % the new guy must be o
            return;
        end
    end
    ok = true;
end
