% TO BE TESTED:
% 
% following iterative call (for a query of 1e3 points):
% for i = 1:np
%    [idxs1(:,i),dists1(:,i)]   =
% kdtree_k_nearest_neighbors(tree,Pquery(i,:),1);
% end
% 
% is much faster than the more direct call :
% 
% idxs1                        = kdtree_nearest_neighbor(tree,Pquery)';
% dists1                       = sqrt(sum((Pquery-Ptree(idxs1,:)).^2,2))';
% 
% Is it normal? (code below)

dim = 4;
np = 5e4;
rr = RandStream('mrg32k3a','Seed',1);
X1 = rand(rr,np,dim);
X2 = rand(rr,np,dim);


tree = kdtree_build(X2);
nbn = 1;
[idxs1, dists1] = deal(zeros(nbn,np));
for i = 1:np
  [idxs1(:,i),dists1(:,i)] = kdtree_k_nearest_neighbors(tree,X1(i,:),nbn);
end
idxs2 = kdtree_nearest_neighbor(tree,X1)';
kdtree_delete(tree);

% check same resukls
dists2 = sqrt(sum((X1-X2(idxs1,:)).^2,2))';
max(abs(idxs1(:)-idxs2(:))),max(abs(dists1(:)-dists2(:)))