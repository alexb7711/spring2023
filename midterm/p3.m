%% Projection matrix onto x1 + x2 + x3 = 0
a1 = [1 -1 0]';
a2 = [1 0 -1]';
A  = [a1,a2];

display("=========================")
display("Projection onto the plane")
P = A*inv(A'*A)*A'

%% Show the projection is onto the plane
display("=========================")
display("Demonstrate this is a projection \nonto the plane by showing P*a1 = a1")
P*a1

%% Projection orthogonal to the space
display("=========================")
display("Projection matrix orthogonal to the space")
Phat = eye(numel(a1)) - P

Phat*a1
