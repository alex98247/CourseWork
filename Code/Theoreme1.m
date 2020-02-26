function Theoreme1()

[taoP1,taoP2] = meshgrid(0:0.1:1,0:0.1:1);
grid = [taoP1(:) taoP2(:)];
X = 0:10^(-3):24;
M = zeros(length(taoP2(:)));
for i=1:length(grid(:, 1))
K = @(x) 1./((1+grid(i, 1)*x).*(1+grid(i, 2)*x));
%Find max
%kappa = x(3) = 1
%epsilon = x(1)
%delta = x(2)
%tau = x(4)
fun = @(x)-(4*x(1)*x(2));
x0 = [0.5,0.000001,0.0000001];
lb = [0.00000001,0.0000001,0.0000001];
ub = [10000,10000,10000];
A = [];
b1 = [];
Aeq = [];
beq = [];
options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');

M1 = fmincon(fun,x0,A,b1,Aeq,beq,lb,ub,@con,options);
M(i) = -fun(M1);
end

plot3(grid(:, 1), grid(:, 2), M);
axis equal
xlabel('taoP1')
ylabel('taoP2')
zlabel('f')

function [c,ceq] = con(x)
c = -(real(1*K(X*1i)-x(1)*conj(K(X*1i)).*K(X*1i)-x(3)*(conj(K(X*1i)-X*1i)).*(K(X*1i) + X*1i))-x(2));
ceq = [];
end
end