clear t c;
syms t c;

%% Define inner product
ip = @(x,y) vpa(int(x*y,t,[0,3]));

%% Impulse response function
h = @(x) (exp(-4*x) + exp(-3*x)).*heaviside(x);

%% y1
y1 = h(3-t)

%% y2
y2 = int(h(t),t);
C  = solve(subs(y2,t,0) + c == 0);
y2 = subs(y2 + C,t,3-t)

%% Grammian
R = double([ip(y1,y1), ip(y1,y2),
            ip(y1,y2), ip(y2,y2)]);
p = [2;4];

%% Solve
c = double(R\p)

%% Create function
x = @(x) c(1)*(exp(-4*(3-x)) + exp(-3*(3-x))) + ...
         c(2)*(7/12 - 1/4*exp(-4*(3-x)) - 1/3*exp(-3*(3-x)));

%% Plot parameters
t = linspace(0,3);
xd = x(t);
hd = h(t);

%% Plot input signal
subplot(3,1,1);
plot(t,xd);
xlabel('t');
ylabel('x(t)');

%% Plot impulse response
subplot(3,1,2);
plot(t,hd);
xlabel('t');
ylabel('h(t)');

%% Calculate output signal
y = conv(xd,hd,'same');

%% Plot output signal
subplot(3,1,3);
plot(t,y,"r-")
xlabel('t');
ylabel('y(t)');

grid on;
