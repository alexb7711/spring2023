function [Q,R] = gramschmidt(T)
  # Determine dimensions and allocate memory for matrices
  [d,n] = size(T);                                                              # Determine dimensions
  m     = min(d,n);                                                             # Determine the smaller value
  R     = zeros(m,n);                                                           # Buffer R matrix
  Q     = zeros(d,m);                                                           # Buffer Q matrix

  for i = 1:m
    p = T(:,i);                                                                 # Get ith vector p_i

    for j = 1:i-1
      R(j,i) = Q(:,j)'*p;                                                       # Calculte R matrix row (q'*B^k)
      p = p-Q(:,j)*R(j,i);                                                      # Calculate A^(k+1)
    end

    R(i,i) = norm(p);                                                           # Normalize and assign diagonal value
    Q(:,i) = p/R(i,i);                                                          # Calculate q_k = e_k/||e_k||
  end

  R(:,m+1:n) = Q'*T(:,m+1:n);                                                   # Calculate A
end
