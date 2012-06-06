clc, clear, close all;

% P = rand( 250, 2 );
% T = kdtree_build(P);
% kdtree_save(T,'mytree.txt');

P = rand(250,2);
T = kdtree(P);

idx = T.nn(rand(1,2))