function w = my_durbin(r)
# Durbin's algorithm for solving a system of equations of the form
#
# Rw = r
#
# where R is a Toeplitz matrix and r is a vector.
#
# Input:
#   - r : Vector of sampled data
#
# Output:
#  - w : Solution

  n  = length(r);                                                               # Get element count
  r  = r(:);                                                                    # Make sure r is a column vec
  r0 = r(1);
  w = r(2)/r(1);                                                                # Get first solution

  # Loop thru and recursively solve
  for k = 2:n-1
    Jw  = flipud(w);
    Jwc = flipud(conj(w));
    a   = (r(k+1) - r(2:k)'*Jw) / (r0 - r(2:k)'*conj(w));
    z   = w - Jwc*a;
    w   = [z; a];
  end
end
