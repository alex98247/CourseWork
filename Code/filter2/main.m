[M1, A1, B1] = filter2_tau0_2e();
[M2, A2, B2] = filter2_tau0_1();

for i=1:length(A1)
    A11(i) = (A1(i)-B1(i))/2;
    B11(i) = -A11(i);
    
    A21(i) = (A2(i)-B2(i))/2;
    B21(i) = -A21(i);
end

%Show results of exact and calculated values nu^2 
plot(A21, M2, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')