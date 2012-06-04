startValue = 1e4;
doublings = 5;

x = zeros(doublings,1);
y = zeros(doublings,1);

for i=1:doublings
       value = startValue * 2^(i-1);
       p = rand( value, 2 );
       tic
       tree = kdtree_build( p );
       y(i) = toc;
       x(i) = value;
       kdtree_delete( tree );
end

figure; loglog(x, y, '.b');
[coeff, r] = polyfit( log(x), log(y),1)
sprintf('y= %0.2g * x^(%0.2f)', exp(coeff(2)), coeff(1))
hold on, plot( x, exp(coeff(2))*x.^(coeff(1)), 'Color', 'red')