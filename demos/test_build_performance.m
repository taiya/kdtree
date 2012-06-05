startValue = 1e3;
doublings = 10;

x = zeros(doublings,1);
y = zeros(doublings,1);

for i=1:doublings
   value = startValue * 2^(i-1);
   p = rand( value, 2 );
   tic
   tree = kdtree_build( p );
   y(i) = toc;
   x(i) = value;
   disp(sprintf('building tree of %d points took %f',value,y(i)));
   kdtree_delete( tree );
end


figure; loglog(x, y, '.b'); title('log-log plot')
[coeff, r] = polyfit( log(x), log(y),1);
disp(sprintf('t= %0.2g * n^(%0.2f)', exp(coeff(2)), coeff(1)))
hold on, plot( x, exp(coeff(2))*x.^(coeff(1)), 'Color', 'red');