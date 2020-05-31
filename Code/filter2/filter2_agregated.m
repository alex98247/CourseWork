[M1, A1, B1] = filter2_exact();
[M2, A2, B2] = filter2_analytic();

for i=1:length(A1)
    if (A1(i) == A2(i)) && (B1(i) == B2(i))
        M(i) = M1(i)- M2(i);
    end
end

%Show results of exact and calculated values nu^2 
plot3(A2, B2, M2, '.', A1, B1, M1, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')