function filter1()

[taoP1,taoP2] = meshgrid(0:0.005:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

a_1 = (-4.*b.^2-2.*a.^2.*b.^2+4.*b.^3+(a.^2-2.*b+b.^2.\2).^2);
D_1 = (b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2).^2-b.^4.*(-4.*b.^2-2.*a.^2.*b.^2+4.*b.^3+(a.^2-2.*b+b.^2.\2).^2);
disp(min(D_1));
disp(min(a_1));
x1 = ((b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2)+sqrt(D_1))./(2.*a_1);
x2 = ((b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2)-sqrt(D_1))./(2.*a_1);
x = max((1-x1).^2,(1-x2).^2);
plot3(grid(:, 1), grid(:, 2), x)
axis equal
xlabel('taoP1')
ylabel('taoP2')
zlabel('f')

disp("Max param value: ");
disp(max(x));
end