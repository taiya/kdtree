classdef kdtree < handle
    %------------------------------------------------------------------------
    %
    %                             PROPERTIES
    %
    %------------------------------------------------------------------------
    properties
        PTR = [];
    end
    
    %------------------------------------------------------------------------
    %
    %                             METHODS
    %
    %------------------------------------------------------------------------
    methods
        %--- Constructor
        function kd = kdtree(p)
            if nargin==1
                kd.PTR = kdtree_build(p);
            else
                kd.PTR = [];
            end
        end
        %--- Destructor
        function delete(kd)
            if ~isempty(kd.PTR)
                % disp('called delete!!'); 
                kdtree_delete(kd.PTR);
            end
        end
        
        %--- Queries
        function nIdxs = nn(kd,query)
            nIdxs = kdtree_nearest_neighbor(kd.PTR,query);
        end
        
        %--- Save/Load from file
        function b = saveobj(kd)
            disp('SAVE: nothing done!');
            b = [];
        end
        function b = loadobj(kd)
            disp('LOAD: nothing done!');
            b = kdtree();
        end        
    end
end