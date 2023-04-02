clear t c;
syms t c;

%% Define inner product
ip = @(x,y) vpa(int(x*y,t,[0,3]));

%% Impulse response function
h = @(x) (exp(-4*x) + exp(-3*x))*heaviside(x);

%% y1
y1 = h(3-t)

%% y2
y2 = int(h(t),t);
C  = solve(subs(y2,t,0) + c == 0);
y2 = y2 + C

%% Grammian
R = [ip(y1,y1), ip(y1,y2);
     ip(y1,y2), ip(y2,y2)]
p = [2;4];

%% Solve
c = R\p
