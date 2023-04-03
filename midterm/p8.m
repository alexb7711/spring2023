%% Define inner product
ip = @(x,y) trace(x*y');

%%==============================================================================
%% (a)
display("======================================================================")
display("Part (a)")

%% Data
x = [2, 5;
     6, 7];

%% Define basis
b1 = [1 0;
      0 0];

b2 = [0 1;
      1 0];

b3 = [0 0;
      0 1];

%% Calculate Grammian
R = [ip(b1,b1),ip(b2,b1),ip(b3,b1);
     ip(b1,b2),ip(b2,b2),ip(b3,b2);
     ip(b1,b3),ip(b2,b3),ip(b3,b3)];

%% Calculate A
A = inv(R'*R)*R'

%% Calculate p
p = [ip(x,b1), ip(x,b2), ip(x,b3)]'

%% Calculate diagonal matrix parameters
%% Note that these parameters are of the form
%%
%% |c1 c2|
%% |c2 c3|
%%
c = A*p

%% Display symmetric matrix
xprj = [c(1) c(2);
        c(2) c(3)]

%%==============================================================================
%% (b)

display("======================================================================")
display("Part (b)")

%% Data
x = [1 3 2 4;
     2 2 2 2;
     4 7 5 3;
     5 4 3 2;
     2 3 4 5];

%% Define basis
b1 = toeplitz([1 1 0 0 0], [1 0 0 0]);
b2 = toeplitz([0 0 1 0 0], [0 1 0 0]);
b3 = toeplitz([0 0 0 1 0], [0 0 1 0]);
b4 = toeplitz([0 0 0 0 1], [0 0 0 1]);

%% Calculate Grammian
R = [ip(b1,b1),ip(b2,b1),ip(b3,b1),ip(b4,b1);
     ip(b1,b2),ip(b2,b2),ip(b3,b2),ip(b4,b2);
     ip(b1,b3),ip(b2,b3),ip(b3,b3),ip(b4,b3);
     ip(b1,b4),ip(b2,b4),ip(b3,b4),ip(b4,b4)];

%% Calculate A
A = inv(R'*R)*R'

%% Calculate p
p = [ip(x,b1), ip(x,b2), ip(x,b3), ip(x,b4)]'

%% Calculate diagonal matrix parameters
c = A*p

%% Display nearest symmetric matrix
b1 = toeplitz([c(1) c(1) 0 0 0], [c(1) 0 0 0]);
b2 = toeplitz([0 0 c(2) 0 0], [0 c(2) 0 0]);
b3 = toeplitz([0 0 0 c(3) 0], [0 0 c(3) 0]);
b4 = toeplitz([0 0 0 0 c(4)], [0 0 0 c(4)]);
xprj = b1 + b2 + b3 + b4
