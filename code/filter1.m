function filter1()

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

a_1 = (b.^4 + 8.*b.^3 - 4.*a.^2.*b.^2 - 16.*a.^2.*b + 4.*a.^4)./4;
D_1 = ((- 2.*b.^4 + 8.*b.^3 + 4.*a.^2.*b.^2)./4).^2 - b.^4.*(b.^4 + 8.*b.^3 - 4.*a.^2.*b.^2 - 16.*a.^2.*b + 4.*a.^4)./4;
disp("Min D1:")
disp(min(D_1));
disp("Min a1:")
disp(min(abs(a_1)));
%Корни уравнения D = 0
x1 = (((- 2.*b.^4 + 8.*b.^3 + 4.*a.^2.*b.^2)./4)+sqrt(D_1))./(2.*a_1);
x2 = (((- 2.*b.^4 + 8.*b.^3 + 4.*a.^2.*b.^2)./4)-sqrt(D_1))./(2.*a_1);
M1 = min(abs(1-x1), abs(1-x2));
%disp(M1);
%M = [];
%for i=1:length(M1)
%    f = @(x) 0.5*pi*x/(x*asin(x)+sqrt(1-x))-M1(i);
%    disp(M1(i));
%    disp(f(0.1));
%    M(i) = fzero(f, 0.1);
%end
%disp(M);
%omega = M1.*(grid(:, 1))

%D = @(x) (x.^2).*(-4*b.^2-2*a.^2.*b.^2+4*b.^3+(a.^2-2*b+(b.^2)./2).^2)-x.((b.^4)./2+2*b.^3-a.^2.*b.^2+4*b.^2) + (b.^4)./4;
%M2 = -(x1.*a.^2-2.*x1.*b-(1-x1).*b.^2./2)+sqrt(D(x1));
plot3(grid(:, 1), grid(:, 2), M1);
axis equal
xlabel('taoP1')
ylabel('taoP2')
zlabel('f')
end