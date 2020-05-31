function [M, A, B] = filter1_analytic()

[taoP1,taoP2] = meshgrid(0.01:0.01:0.99,0.01:0.01:0.99);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

A = a;
B = b;
M = (b - 1).^2./(a.^2 - 2.*b + 1);

plot3(grid(:, 1), grid(:, 2), M, '.');
axis equal
xlabel('taoP1')
ylabel('taoP2')
zlabel('nu^2')
end