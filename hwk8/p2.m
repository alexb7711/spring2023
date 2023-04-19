A1 = [4 3; 3 6];
A2 = [1 2; 3 0];
A3 = [1 2; 0 1];

%% l1
display("===========================")
display("l1 norm")

norm(A1, 1)
norm(A2, 1)
norm(A3, 1)

%% l2
display("===========================")
display("l2 norm")

norm(A1, 2)
norm(A2, 2)
norm(A3, 2)


%% Frobenius
display("===========================")
display("Frobenius norm")

norm(A1, "fro")
norm(A2, "fro")
norm(A3, "fro")

%% linf
display("===========================")
display("linf norm")

norm(A1, "inf")
norm(A2, "inf")
norm(A3, "inf")