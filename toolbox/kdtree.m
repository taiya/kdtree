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
        %--- Automatic destructor
        function delete(kd)
            if ~isempty(kd.PTR)
                kdtree_delete(kd.PTR);
            end
        end
        
        %--- Nearest neighbor query
        function idxs = nn(kd,query)
            idxs = kdtree_nearest_neighbor(kd.PTR,query);
        end
        %--- K-Nearest-Neighbors query
        function [idxs,dists] = knn(kd,query,n)
            [idxs,dists] = kdtree_k_nearest_neighbors(kd.PTR,query,n);
        end
        %--- Hypersphere query
        function idxs = ball(kd,query,radius)
            idxs = kdtree_ball_query(kd.PTR,query,radius);
        end
        %--- Range query
        function idxs = range(kd, range)
            idxs = kdtree_range_query(kd.PTR, range);
        end

        %--- Save to .mat file
        function out = saveobj(kd)
            out = kdtree_to_matlab(kd.PTR);
        end        
    end
    
    %------------------------------------------------------------------------
    %
    %                           STATIC METHODS
    %
    %------------------------------------------------------------------------

    methods(Static)
        % Manages 'load matlab.mat'
        function tree = loadobj(matinput)
            tree = KDTree();
            tree.PTR = kdtree_from_matlab(matinput);
        end        
        % Compiles the kdtree library        
        function compile()
            kdtree_compile();
        end        
    end
end