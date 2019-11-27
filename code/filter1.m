function filter1()

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

a_1 = (-4.*b.^2-2.*a.^2.*b.^2+4.*b.^3+(a.^2-2.*b+b.^2.\2).^2);
D_1 = (b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2).^2-b.^4.*(-4.*b.^2-2.*a.^2.*b.^2+4.*b.^3+(a.^2-2.*b+b.^2.\2).^2);
disp("Min D1:")
disp(min(D_1));
disp("Min a1:")
disp(min(a_1));
%Корни уравнения D = 0
x1 = ((b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2)+sqrt(D_1))./(2.*a_1);
x2 = ((b.^4.\2+2.*b.^3-a.^2.*b.^2+4.*b.^2)-sqrt(D_1))./(2.*a_1);
M1 = max((1-x1).^2,(1-x2).^2);

X1 = min(x1, x2);
X2 = max(x1, x2);
for i=1:length(X1)
    eq = @(x) -(x*a(i)^2-2*x*b(i)-(1/2-x/2)*b(i)^2)+sqrt((-4*b(i)^2-2*a(i)^2*b(i)^2+4*b(i)^3+(a(i)^2-2*b(i)+b(i)^2/2)^2)*x^2 - (b(i)^4/2+2*b(i)^3-a(i)^2*b(i)^2+4*b(i)^2)*x + b(i)^4/4);
    z11(i) = X1(i);
    while eq(z11(i)) <= 0
        z11(i)=z11(i)+0.00001;
    end
    z11(i)=z11(i)-0.00001;
    
    z12(i) = X2(i);
    while eq(z12(i)) <= 0
        z12(i)=z12(i)-0.00001;
    end
    z12(i)=z12(i)+0.00001;
    disp(i+"/"+length(X1));
end
z11 = transpose(z11);
z12 = transpose(z12);
MM = max(M1, z11);
M = max(MM, z12);
plot3(grid(:, 1), grid(:, 2), M);
axis equal
xlabel('taoP1')
ylabel('taoP2')
zlabel('f')
end