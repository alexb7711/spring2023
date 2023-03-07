## usage: plattice (b)
##
##
function plattice (b,fn)
  # Set up parameters
  xr = [0, 40];
  yr = [0, 20];
  e  = 100;

  # Default vector
  if nargin == 0
  b  = [10, 12;
        2,  5];
  end

  # Create matrix of integers
  [x, y] = meshgrid(-e:e);
  xy     = [x(:),y(:)];

  # Calculate permutations
  B = xy*b';

  # Separate x and y values
  xt = reshape(B(:,1), size(x));
  yt = reshape(B(:,2), size(y));

  # Plot

  ## Plot lattice
  fig = figure();
  plot(xt, yt, 'ro');
  hold on;

  ## Plot basis vectors
  plot(b(:,1), 'b-');
  plot(b(:,2), 'g-');

  ## Plot filled region
  v = [[0;0], b(:,1), b(:,1)+b(:,2), b(:,2)];
  fill(v(1,:), v(2,:), 'c');

  ## Adjust axis
  axis([xr yr]);

  ## Save plot
  print(fig, [fn ".png"]);
end
