%% Define inner product
ip = @(x,y) trace(x*y');

%%==============================================================================
%% (a)

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
c = P*b

%%==============================================================================
%% (b)
