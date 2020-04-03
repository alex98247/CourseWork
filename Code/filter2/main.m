[M1, A1, B1] = filter2_exact_D();
[M2, A2, B2] = filter2_analytic();

%Show results of exact and calculated values nu^2 
plot3(A2, B2, M2, '.', A1, B1, M1, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')