clc, clear, close all;
N = 100000; % #dataset
D = 5;     % #dims 
M = 10000;   % #test queries

rand('twister',1); %#ok<RAND>
p = rand(N,D);
kd = kdtree_build(p);

for i=1:1
    query = rand(1,D);
    idx = kdtree_nearest_neighbor(kd,query);
    
    dists = sum( (p - repmat(query,[N,1])).^2,2 );
    [~,idx2] = min(dists);
    
    assert( idx == idx2 );
end

kdtree_delete(kd);

if D==2
    hold on
    plot(p(:,1),p(:,2),'.r');
    plot(query(:,1),query(:,2),'.b');
    plot(p(idx,1),p(idx,2),'+g','markersize',10);
    plot(p(idx2,1),p(idx2,2),'oy','markersize',10);
end