##==============================================================================
## (a) Design filter

rng(1);                                                                         # Seed random number generator

## Parametors
a1 = -0.7;
a2 = 0.12;
sv = 0.1;
sn = 0.16;

## Calculate r values
r0 = (1+a2)/(1-a2) * (sv)/((1+a2)^2 - a1^2);
r1 = -a1/(1+a2)*r0;

## Create Rzz matrix
Rnn = sn*eye(2);
Ruu = [r0 r1;
       r1 r0];
Rzz = Rnn + Ruu;

## Calculate p vector
p    = [0;0];
p(1) = r0 - 0.4*r1;
p(2) = r1 - 0.4*r0;

## Solve for coefficients
h = inv(Rzz)*p

##==============================================================================
## (b) Simulate
x0 = 1;
N  = 1000;
t  = [1:N];

## Propagate d
d = [];
d = [d, x0];

for i = 2:N
  d = [d, 0.3*d(i-1) + random("normal",0,sn,[1,1])];
end

## Propagate dhat
dh = [];
dh = [dh, x0];

for i = 2:N
  dh = [dh, h(1) + h(2)*dh(i-1) + random("normal", 0, sn, [1,1])];
end

## Plot responses
clf reset;
hold on;
plot(t,d)
plot(t,dh)
hold off;

##==============================================================================
## (c) Plot frequency response
t = 1:100;
figure;
hold on;

Hc = [];
He = [];

for i = t
  Hc = [Hc, norm(1/(1-0.4*exp(-i*1j)))];
  He = [He, norm(h(1) + h(2)*exp(-i.*1j))];
end

plot(t,Hc);
plot(t,He);

hold off;

##==============================================================================
## (c) Plot frequency response
x0 = 1;
N  = 1000;
t  = [1:N];

## Propagate d
d = [];
d = [d, x0];

for i = 2:N
  d = [d, 0.3*d(i-1) + random("normal",0,sn,[1,1])];
end

## Propagate dhat
dh = [];
dh = [dh, x0];

for i = 2:N
  dh = [dh, 0.25*h(1) + h(2)*0.5*dh(i-1) + random("normal", 0, sn, [1,1])];
end

## Plot responses
figure;
hold on;
plot(t,d)
plot(t,dh)
hold off;

## close all;
