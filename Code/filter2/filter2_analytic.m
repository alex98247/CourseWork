function [M, A, B] = filter2_analytic()

%For tau = 0, a > 0, c > 0, b > 0
[taoP1,taoZ1] = meshgrid(0.0001:0.01:1,0.0001:0.01:1);
grid = [taoP1(:) taoZ1(:)];

a = grid(:, 1);
b = grid(:, 2);

A = [];
B = [];
M = [];

for i=1:length(a)
    if(a(i) > b(i))
        M = [M 4*maximize(a(i), b(i))];
        A = [A a(i)];
        B = [B b(i)];
    end
end

for i=1:length(a)
    if(a(i) < b(i))
        M = [M 4*maximize(b(i), a(i))];
        A = [A a(i)];
        B = [B b(i)];
    end
end

plot3(A, B, M, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')
end