x = [4.8, 2.3, 2.4, 1.8, 4.7, 1.8, 0.6, 3.8, 2.0, 1.3, 2.1, 0.4, 0.5, 4.8, 4.8,  2.9, 0.1, 1.2, 1.8, 4.3]';
y = [98.9, 21.7, 27.1, 20.2, 98.3, 23.3, 4.1, 75.4, 20.7, 15.8, 17.6, 6.7, 1.3, 103.3, 110.6, 48.8, -2.4, 17.4, 23.1, 81.5]';
A = [];
e = [];

%% Construct A matrix
for i = 1:numel(x)
  A = [A; 1, x(i), x(i)^2];
end

%% Calculate coefficients
c = inv(A'*A)*A'*y;

%% Define function
f = @(x) c(1) + c(2)*x + c(3)*x^2;

%% Display measure of fitness ||e||_2^2 = e1^2 + e2^2 + ... + en^2
for i = [x';1:numel(x)]
  e = [e (f(i(1)) - y(i(2)))^2];
end

E = sum(e);                                                                     % Sum the error terms

display(sprintf("The measure of error is %f", E));

%% Plot data
plot(x,y,'b*');
hold on;

%% Plot fitted curve
fplot(f, [0, 5]);
hold off;
