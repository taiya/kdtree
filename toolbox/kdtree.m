% Matlab class
classdef KDTree < handle
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
        function kd = KDTree(p)
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
        function idxs = nn(kd,query)
            idxs = kdtree_nearest_neighbor(kd.PTR,query);
        end
        function [idxs,dists] = knn(kd,query,n)
            [idxs,dists] = kdtree_k_nearest_neighbors(kd.PTR,query,n);
        end
        function idxs = ball(kd,query,radius)
            idxs = kdtree_ball_query(kd.PTR,query,radius);
        end
        
        %--- Save/Load from file
        function out = saveobj(kd)
            out = kdtree_to_matlab(kd.PTR);
        end
        
        function tree = loadobj(kd)
            tree = KDTree();
            error('load not implemented');
        end        
    end
    methods(Static)
        function compile()
            kdtree_compile();
        end        
    end
end