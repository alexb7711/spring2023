s1 = rand(3,10);
s2 = rand(3,10);
s = [];

T = s2(1,:).'/norm(s2)

for i = 1:length(s1)
  s = [s norm(T'*T*s2(i))];
end

s'

s1 = sum(s)
