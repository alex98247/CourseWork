function [M, A, B] = filter2_diff()

[M1, A1, B1] = filter2_exact_ABC();
[M2, A2, B2] = filter2_analytic();

disp(A1)
disp(A2)
end