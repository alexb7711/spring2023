1;

%%==============================================================================
%% Functions
function x = bin2char(x)
  x=num2str(x);
  x(isspace(x))=[];
  x=bin2dec(x);
  x=char(x);
end

%%==============================================================================
%% Script

% Public key and secret message
pkey = [906 897 817 260 594 22 425];
s    = 3278;

% Create lattice
m      = numel(pkey)+1;
C      = eye(m);
C(m,:) = [-pkey s];

% Hackerman time
B = LLL(C,false);

for j=1:7
  if length(find(abs(B(1:7,j))<=1)) == 7
    x = abs(B(1:7,j))';
    ans = bin2char(x);
    fprintf('The LLL decryption text is: %s\n', ans);
    break
  end
end
