function [x,y] = p_norm_circle(p, r, step)

  if nargin < 3
    step = 0.01;
    if nargin < 2
      r = 1;
    end
  end

  x = -r:step:r;
  y = (r^p - abs(x).^p).^(1/p);

end
