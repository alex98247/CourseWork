function filter2_all()
[M1, A1, B1] = filter2_tau0_1e();
[M2, A2, B2] = filter2_tau0_2e();

maxLength = max(length(M1), length(M2));
for i=1:maxLength
end