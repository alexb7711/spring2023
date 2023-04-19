clear t c;
syms t c;

%% End time
T = 1

%% Define inner product
ip = @(x,y) vpa(int(x*y,t,[0,T]));

%% Impulse response function
h = @(x) (exp(-2*x) + 3*exp(-4*x));

%% y1
y1 = h(T-t)

%% y2
y2 = int(h(t),t);
C  = solve(subs(y2,t,0) + c == 0);
y2 = subs(y2 + C,t,T-t)

%% Grammian
R = double([ip(y1,y1), ip(y1,y2);
            ip(y1,y2), ip(y2,y2)])
p = [1;0];

%% Solve
c = double(R\p)

%% Create function
x = @(x) c(1)*(exp(-2*(T-x) + 3*exp(-4*(T-x)))) + ...
         c(2)*(5/4 - 1/2*exp(-2*(T-x)) - 3/4*exp(-4*(T-x)));

%% Plot parameters
t = linspace(0,T);
xd = x(t);
hd = h(t);

%% Plot input signal
subplot(3,1,1);
## plot(t,xd);
stem(xd);
xlabel('t');
ylabel('x(t)');

%% Plot impulse response
subplot(3,1,2);
## plot(t,hd);
stem(hd);
xlabel('t');
ylabel('h(t)');

%% Calculate output signal
y = conv(xd,hd,"same");

%% Plot output signal
subplot(3,1,3);
## plot(t,y)
stem(y)
xlabel('t');
ylabel('y(t)');

grid on;
## close all;
