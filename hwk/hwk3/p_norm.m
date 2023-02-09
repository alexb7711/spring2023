function [x,y] = p_norm(p, r, dt)

  if nargin < 3
    dt = 0.01;
    if nargin < 2
      r = 1;
    end
  end

  x = -r:dt:r;
  y = (r^p - abs(x).^p).^(1/p);

end
