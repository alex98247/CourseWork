[M1, A1, B1] = filter2_tau0_1e();
[M2, A2, B2] = filter2_tau0_1();

%Show results of exact and calculated values nu^2 
plot3(A1, B1, M1, '.', A2, B2, M2, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')