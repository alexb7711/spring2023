l1 = 5;
l2 = 10;

x1 = [3,4]';
x2 = [-4,3]';

%% normalize
n = det(diag([l1, l2]))/2

p1 = 1/n*x1*x1'
p2 = 1/n*x2*x2'

A = l1*p1 + l2*p2

[v,d] = eig(A)
