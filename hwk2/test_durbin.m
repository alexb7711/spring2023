function test_durbin()
  n = 10;
  r = rand(n+1,1);
  T = toeplitz(r(1:n));
  x = T\r(2:end);
  w = my_durbin(r);

  # Compare with some small tolerance
  if all(abs(x - w) <= 0.0001)
    disp("They are the same");
  else
    disp("Uh oh");
  end
end
