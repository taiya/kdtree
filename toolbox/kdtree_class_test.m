clc, clear, close all;

% Input data
data = rand(250,2);

% Build tree (now auto-allocated)
kdtree = KDTree(data);

% Nearest neighbors
query = rand(10,2);
idxs1 = kdtree.nn(query);

% K nearest neighbors
K = 10;
query = rand(1,2);
idxs2 = kdtree.knn(query,K);

% Ball query
radii = .5;
idxs3 = kdtree.ball(query, radii);

save matlab.mat kdtree