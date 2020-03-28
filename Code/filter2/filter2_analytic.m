function [M, A, B] = filter2_analytic()

%For tau = 0, a > 0, c > 0, b > 0
[taoP1,taoZ1] = meshgrid(0.0001:0.01:1,0.0001:0.01:1);
grid = [taoP1(:) taoZ1(:)];

a = grid(:, 1);
b = grid(:, 2);

A1 = [];
B1 = [];
M1 = [];

for i=1:length(a)
    if(a(i) > b(i))
        tmp = 4*maximize(a(i), b(i));
            A1(i) = a(i);
            B1(i) = b(i);
            M1(i) = tmp;
    end
end

%Symmetry with respect to a line x=y
A = [A1, B1];
B = [B1, A1];
M = [M1, M1];

plot3(A, B, M, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')
end