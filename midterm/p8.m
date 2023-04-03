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
b1 = toeplitz([0 0 0 0 0], [0 0 0 1]);
b2 = toeplitz([0 0 0 0 0], [0 0 1 0]);
b3 = toeplitz([0 0 0 0 0], [0 1 0 0]);
b4 = toeplitz([1 0 0 0 0], [1 0 0 0]);
b5 = toeplitz([0 1 0 0 0], [0 0 0 0]);
b6 = toeplitz([0 0 1 0 0], [0 0 0 0]);
b7 = toeplitz([0 0 0 1 0], [0 0 0 0]);
b8 = toeplitz([0 0 0 0 1], [0 0 0 0]);

%% Calculate Grammian
R = [ip(b1,b1),ip(b2,b1),ip(b3,b1),ip(b4,b1),ip(b5,b1),ip(b6,b1),ip(b7,b1),ip(b8,b1);
     ip(b1,b2),ip(b2,b2),ip(b3,b2),ip(b4,b2),ip(b5,b2),ip(b6,b2),ip(b7,b2),ip(b8,b2);
     ip(b1,b3),ip(b2,b3),ip(b3,b3),ip(b4,b3),ip(b5,b3),ip(b6,b3),ip(b7,b3),ip(b8,b3);
     ip(b1,b4),ip(b2,b4),ip(b3,b4),ip(b4,b4),ip(b5,b4),ip(b6,b4),ip(b7,b4),ip(b8,b4);
     ip(b1,b5),ip(b2,b5),ip(b3,b5),ip(b4,b5),ip(b5,b5),ip(b6,b5),ip(b7,b5),ip(b8,b5);
     ip(b1,b6),ip(b2,b6),ip(b3,b6),ip(b4,b6),ip(b5,b6),ip(b6,b6),ip(b7,b6),ip(b8,b6);
     ip(b1,b7),ip(b2,b7),ip(b3,b7),ip(b4,b7),ip(b5,b7),ip(b6,b7),ip(b7,b7),ip(b8,b7);
     ip(b1,b8),ip(b2,b8),ip(b3,b8),ip(b4,b8),ip(b5,b8),ip(b6,b8),ip(b7,b8),ip(b8,b8)];

%% Calculate A
A = inv(R'*R)*R'

%% Calculate p
p = [ip(x,b1), ip(x,b2), ip(x,b3), ip(x,b4), ip(x,b5), ip(x,b6), ip(x,b7), ip(x,b8)]'

%% Calculate diagonal matrix parameters
c = A*p

%% Display nearest symmetric matrix
b1 = toeplitz([0 0 0 0 0], [0 0 0 c(1)]);
b2 = toeplitz([0 0 0 0 0], [0 0 c(2) 0]);
b3 = toeplitz([0 0 0 0 0], [0 c(3) 0 0]);
b4 = toeplitz([c(4) 0 0 0 0], [c(4) 0 0 0]);
b5 = toeplitz([0 c(5) 0 0 0], [0 0 0 0]);
b6 = toeplitz([0 0 c(6) 0 0], [0 0 0 0]);
b7 = toeplitz([0 0 0 c(7) 0], [0 0 0 0]);
b8 = toeplitz([0 0 0 0 c(8)], [0 0 0 0]);
xprj = b1 + b2 + b3 + b4 + b5 + b6 + b7 + b8
