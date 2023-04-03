##==============================================================================
# (a)

## Data
x = [2, 2.5, 3, 5, 9];
y = [-4.2, -5, -2, 1, 24.3];

## Plot data
plot(x,y);
hold on;

##==============================================================================
# (b)

## Determine least-squares parameters
A      = ones(numel(x),2);
A(:,1) = x';

## Determine least-squares fit
c      = inv(A'*A)*A'*y';

## Plot least-squares fit
lsf    = @(c,x) c(1)*x + c(2);
xre    = [x(1):x(end)];
plot(xre, lsf(c,xre));

##==============================================================================
# (c)

## Weight
W = diag([10,1,1,1,10]);

## Recalculate least-squares fit
c = inv(A'*W*A)*A'*W*y';

## Plot least-squares fit
plot(xre, lsf(c,xre));

hold off;
