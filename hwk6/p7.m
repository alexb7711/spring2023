## Given parameters
## x[t] = a1 x[t-1] + a2 x[t-2] + ... + a4 x[t-4] + v[t]
rng(1);                                                                         # Seed random number generator

N = 10;                                                                         # Number of equations

a  = [-0.3957; 0.2417; -0.0454; -0.3136];                                       # AR process
ov = 0.1;                                                                       # Noise SD
f  = zeros([N,numel(a)]);                                                       # Actual signal
x  = zeros([N,numel(a)]);                                                       # Measured data
d  = zeros(N,1);                                                                # Desired outputs
t  = [1:N];                                                                     # Time steps
m  = 4;

##==============================================================================
## (a)

## Initialize

## Create realizations
# Inititialize 1 with a number, 2 with a4*x0, 3 with a4 + a3 ....
f(:,1) = 1;
f(:,2) = a(1)*f(:,1);
f(:,3) = a(1)*f(:,2) + a(2)*f(:,1);
f(:,4) = a(1)*f(:,3) + a(2)*f(:,2) + a(3)*f(:,1);
x(:,1:4) = f(:,1:4) + random("normal", 0, ov, [N,4]);                           # Apply noise

for i = 5:N
  f(:,i) = a(1)*x(:,i-1) + a(2)*x(:,i-2) + a(3)*x(:,i-3) + a(4)*x(:,i-4);
  x(:,i) = f(:,i); + random("normal", 0, ov, [N,1]);                            # Apply noise
end

## Plot realizations
clf reset;
hold on;

for i = 1:N
  plot(t,x(i,:));
end

hold off;

##==============================================================================
## (b)

##------------------------------------------------------------------------------
## Covariance method

## Calculate desired values
d = zeros(1,N-m+1);

for i = 1:N-m
  d(1,i) = f(1,i+m);
end

## Create Toeplitz matrix
A = [];
x = x(1,:);
for i=m:N
  A = [A;x(i:-1:i-m+1)];
end

## Determine coefficients
h = pinv(A)*d'

##------------------------------------------------------------------------------
## Forward/Backward method
x = x';

## Calculate desired values
d = [];

d = [f(m+1:N)];
d = [d, conj(f(1:N-m))];

## Create Toeplitz matrix
A = [];

for i = 1:N-m
  A = [A;x(m+i-1:-1:i).'];
end
for i = 1:N-m
  A = [A;x(i+1:m+i)'];
end

## Determine coefficients
size(pinv(A))
size(d)
h = pinv(A)*d'

##==============================================================================
## (c)

## Plot real spectrum
figure
hold on;

str = @(w) norm(ov/(1+a(1)*exp(1j*w) + a(2)*exp(-2j*w) + a(3)*exp(-3j*w) + a(4)*exp(-4j*w)))^2;

for i = 1:0.1:10
plot(i, str(i));
end

hold off

## Plot estimated spectrum
figure
hold on;

ste = @(w) norm(ov/(1+h(1)*exp(1j*w) + h(2)*exp(-2j*w) + h(3)*exp(-3j*w) + h(4)*exp(-4j*w)))^2;

for i = 1:0.1:10
  plot(i, ste(i));
end

hold off;
