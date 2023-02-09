figure;
hold on;

# For each norm `p'
for p = [4 3 2 1 0.8 0.5 0.2]
  [x,y]=p_norm(p,1);
  plot([x, -x], [y -y]);
end

title("Plots of Norms");
h = legend('4','3','2','1','0.8','0.5','0.2');
legend(h, "location", "northeast")
