function filter1_exact()

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

%x(1) = tau, x(2) = delta, x(3) = kappa
M = [];
A = [];
B = [];
fun = @(x)-(4*(x(3)-x(1)-x(2))*x(2)/(x(3))^2);
x0 = [0.05, 0.5, 1];
lb = [0.00000001,0.0001, 0.00001];
ub = [10000,10000,10000];
for i=1:length(a)
    ai = a(i);
    bi = b(i);
    options = optimoptions('fmincon','Display','off','Algorithm','sqp');
    M1 = fmincon(fun,x0,[],[],[],[],lb,ub,@discriminant,options);
        if((-M1(3)*bi+M1(1)-M1(2)*ai^2 + 2*M1(2)*bi) > 0 && (M1(1)*ai^2-2*M1(1)*bi - M1(2)*bi^2) > 0 && M1(1) > 0)
            M(i) = -fun(M1);
            A(i) = grid(i, 1);
            B(i) = grid(i, 2);
            disp(i/length(a));
        end
end

plot3(A, B, M,'.');
axis equal
xlabel('tauP1')
ylabel('tauP2')
zlabel('nu^2')

%a > 0, b > 0, c > 0
function [c,ceq] = discriminant(x)
c(1) = -(-x(3)*bi+x(1)-x(2)*ai^2 + 2*x(2)*bi);
c(2) = -(x(1)*ai^2-2*x(1)*bi - x(2)*bi^2);
c(3) = -bi^2*x(1);
c(4) = -(x(3)-x(2)-x(1));
ceq = [];
end
end