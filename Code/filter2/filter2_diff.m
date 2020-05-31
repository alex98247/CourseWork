function [M, A, B] = filter2_diff()

[M1, A1, B1] = filter2_exact_ABC();
[M2, A2, B2] = filter2_analytic();

M = [];

for i=1:length(A1)
    if (A1(i) == A2(i)) && (B1(i) == B2(i))
        M = [M abs(M1(i)-M2(i))];
    end
end

M_diff = abs(M1-M2);
max_diff = max(M_diff); %max_diff = 3.3111e-07
disp(max_diff)
disp(A1)
disp(A2)
end