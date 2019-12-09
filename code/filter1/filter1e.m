function filter1e()
t = sym('t');

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

M = [];
A = [];
B = [];
fun = @(x)-(4*x(1)*x(2)/(x(3))^2);
x0 = [0.05, 0.5, 1, 0.7];
lb = [0.00000001,0.0001, 0.00001, 0.00000001];
ub = [10000,10000,10000, 1000000];
AA = [];
b1 = [];
Aeq = [];
beq = [];
for i=1:length(a)
    ai = a(i);
    bi = b(i);
    options = optimoptions('fmincon','Display','off','Algorithm','sqp');
    M1 = fmincon(fun,x0,AA,b1,Aeq,beq,lb,ub,@discriminant,options);
        if((-M1(3)*bi+M1(4)-M1(2)*ai^2 + 2*M1(2)*bi) > 0 && (M1(4)*ai^2-2*M1(4)*bi - M1(2)*bi^2) > 0 && M1(4) > 0)
            M(i) = -fun(M1);
            A(i) = ai;
            B(i) = bi;
            disp(-M1(3)*bi+M1(4)-M1(2)*ai^2 + 2*M1(2)*bi)
        end
    %M(i) = 1000*vpasolve(0.5*pi*t/(t*asin(t) + sqrt(1-t^2)) == M(i), t);
end

plot3(grid(:, 1), grid(:, 2), M);

function [c,ceq] = discriminant(x)
c(1) = -(-x(3)*bi+x(4)-x(2)*ai^2 + 2*x(2)*bi);
c(2) = -(x(4)*ai^2-2*x(4)*bi - x(2)*bi^2);
c(3) = -bi^2*x(4);
c(4) = -(x(3)-x(2)-1-x(1));
ceq = [];
end
end