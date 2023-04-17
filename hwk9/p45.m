%%==============================================================================
%% (a)
display("(a)-------------------------------------------------------------------")
l1 = 10;
l2 = 2;

x1 = [1,-5]';
x2 = [5,1]';

P = [x1 x2]
D = diag([l1 l2])
R = P*D*inv(P)

[v,d] = eig(R)

%%==============================================================================
%% (b)
display("(b)-------------------------------------------------------------------")
npoints = 200;

%% Generate random points
mean = 0;
x = mvnrnd(mean,R,npoints);

%% Plot points
display("Plotting data...")
plot(x(:,1), x(:,2), "r+")
hold on;


%%==============================================================================
%% (c)
display("(c)-------------------------------------------------------------------")

%% Sum all the vectors
for i = 1:length(x)
  S = x(i,:)'*x(i,:);
end

%% Calculate estimate
S = 1/(npoints-1) * S

%% Calculate principal components
pc   = eig(S);
[v,d]= eig(S);
[lmax, imax] = max(pc)
[lmin, imin] = min(pc)

%% Plot components
a1 = v(:,imax)
a2 = v(:,imin)

p1x = [0 a1(1)];
p1y = [0 a1(2)];
p2x = [0 a2(1)];
p2y = [0 a2(2)];

plot(p1x, p1y,"b-")
plot(p2x, p2y,"b-")
hold off;
