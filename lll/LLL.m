%%==============================================================================
%% LLL
function A = LLL(A, plot)
  % Variables
  delta = .75;                                                                  % The default value of the parameter
  m     = length(A);                                                            % The dimension of the vector space
  B     = zeros(m,m);                                                           % Columns of B are the vectors after the Gram-Schmidt process
  mu    = zeros(m,m);                                                           % The matrix mu stores the GS coefficients
  M     = zeros(1,m);                                                           % M(i) is the norm squared of the i-th column of B
  m     = length(A);                                                            % The dimension of the vector space

  % Gram-Schmidt orthogonalization
  B(:,1)     = A(:,1);
  M(1)       = dot(B(:,1), B(:,1));
  [A,B,M,mu] = mgs(A,B,M,mu,2,m);

  % Begin reduction process
  k     = 2;                                                                    % Index for LLL

  while k <= m
    % Size reduction
    [A,mu] = reduce(A,mu,k);

    % Check the Lovasz condition
    if dot(B(:,k),B(:,k)) >= (delta - abs(mu(k,k-1))^2)* dot(B(:,(k-1)),B(:,(k-1)))
      k = k+1;                                                                  % Increment k if the Lovasz condition holds
    else
      % If the Lovasz condition fails, swap the k-th and (k-1)-st basis vector
      v = A(:,k);
      A(:,k) = A(:,k-1);
      A(:,k-1) = v;

      % Update GS coefficients
      [A,B,M,mu]         = mgs(A,B,M,mu,k-1,k);
      mu((k+1):m,(k-1):k) = (A(:,(k+1):m)'* B(:,(k-1):k)) / diag(M((k-1):k));

      % Increment k
      if k > 2
        k = k-1;
      end                                                                       % if
    end                                                                         % if
  end                                                                           % while

  % Plot Lattice
  if plot == true
    plattice(A, "lattice");
  end                                                                           % if

end                                                                             % LLL

%%==============================================================================
%% Reduce
function [A,mu] = reduce(A,mu,k)
    for i = (k-1):-1:1
      q = round(mu(k,i));

      if q ~=0
        A(:,k) = A(:,k) - q*A(:,i);                                             % Reduce the k-th basis vector size
        mu(k,1:i) =  mu(k,1:i) - q*[mu(i,1:(i-1)) 1];                           % Update the GS coefficients
      end                                                                       % if
    end                                                                         % for
end                                                                             % reduce

%%==============================================================================
%% Modified Gram-Schmidt
function [A,B,M,mu] = mgs(A,B,M,mu,s,e)
  for i = s:e
    mu(i,1:(i-1)) = (A(:,i)'* B(:,1:(i-1))) ./ M(1:(i-1));
    B(:,i)        = A(:,i) - B(:,1:(i-1))*mu(i,1:(i-1))';
    M(i)          = dot(B(:,i), B(:,i));
  end
end
