[M1, A1, B1] = filter1_exact();
[M2, A2, B2] = filter1_analytic();

M_diff = abs(M1-transpose(M2));
max_diff = max(M_diff); %max_diff = 0.0080
disp(max_diff)
plot3(A1, B1, M_diff, '.');
axis equal
xlabel('tauP1')
ylabel('tauP2')
zlabel('nu^2')