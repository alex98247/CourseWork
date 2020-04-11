function [M, A, B] = filter2_exact()

[M1, A, B] = filter2_exact_ABC();
[M2, ~, ~] = filter2_exact_D();

M = max(M1, M2);

plot3(A, B, M, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')
end