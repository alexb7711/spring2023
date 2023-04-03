# Data
y = [0.32; 0.25; 0.1; -0.0222; 0.0006; -0.0012; 0.0005; -0.0001];

# Create matrix/vectors
R = -1.*[y(3) y(2) y(1);
        y(4) y(3) y(2);
        y(5) y(4) y(3)];
c = [y(4);y(5);y(6)];

# Solve
a = R\c;

# Find modes
modes = roots([1 a(1) a(2) a(3)])

# Find `C' constants
P = [p1(1) p2(1) p3(1);
     p1(2) p2(2) p3(2);
     p1(3) p2(3) p3(3)];
Y = [y(1); y(2); y(3)];
C = P\Y

# Sigma 1
disp("Noise variance");
sigma = 0.01

# Apply noise
y1 = sigma.*randn(8,1).*y;

# Create matrix/vectors
R = -1*[y1(3) y1(2) y1(1);
        y1(4) y1(3) y1(2);
        y1(5) y1(4) y1(3)];
c = [y1(4);y1(5);y1(6)];

# Solve
a = R\c;

# Find modes
modes = roots([1 a(1) a(2) a(3)])

# Find `C' constants
P = [p1(1) p2(1) p3(1);
     p1(2) p2(2) p3(2);
     p1(3) p2(3) p3(3)];
Y = [y1(1); y1(5); y1(6)];
C = P\Y

# Sigma 2
disp("Noise variance");
sigma = 0.05

# Apply noise
y1 = sigma.*randn(8,1).*y;

# Create matrix/vectors
R = -1*[y1(3) y1(2) y1(1);
        y1(4) y1(3) y1(2);
        y1(5) y1(4) y1(3)];
c = [y1(4);y1(5);y1(6)];

# Solve
a = R\c;

# Find modes
modes = roots([1 a(1) a(2) a(3)])

# Find `C' constants
P = [p1(1) p2(1) p3(1);
     p1(2) p2(2) p3(2);
     p1(3) p2(3) p3(3)];
Y = [y1(1); y1(2); y1(3)];
C = P\Y

# Sigma 3
disp("Noise variance");
sigma = 0.1

# Apply noise
y1 = sigma.*randn(8,1).*y;

# Create matrix/vectors
R = -1*[y1(3) y1(2) y1(1);
        y1(4) y1(3) y1(2);
        y1(5) y1(4) y1(3)];
c = [y1(4);y1(5);y1(6)];

# Solve
a = R\c;

# Find modes
modes = roots([1 a(1) a(2) a(3)])

# Find `C' constants
P = [p1(1) p2(1) p3(1);
     p1(2) p2(2) p3(2);
     p1(3) p2(3) p3(3)];
Y = [y1(1); y1(2); y1(3)];
C = P\Y

# Sigma 4
disp("Noise variance");
sigma = 0.0001

# Apply noise
y1 = sigma.*randn(8,1).*y;

# Create matrix/vectors
R = -1*[y1(3) y1(2) y1(1);
        y1(4) y1(3) y1(2);
        y1(5) y1(4) y1(3)];
c = [y1(4);y1(5);y1(6)];

# Solve
a = R\c;

# Find modes
modes = roots([1 a(1) a(2) a(3)])

# Find `C' constants
P = [p1(1) p2(1) p3(1);
     p1(2) p2(2) p3(2);
     p1(3) p2(3) p3(3)];
Y = [y1(1); y1(2); y1(3)];
C = P\Y
