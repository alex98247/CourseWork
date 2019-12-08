function filter2_1()
x = sym('x');

%For tau = 0
[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];
Kvco = 1000;

a = grid(:, 1);
b = grid(:, 2);

M = [];
A = [];
B = [];
fun = @(x)-(4*x(1)*x(2)/(x(3))^2);
x0 = [0.5, 0.05, 2];
lb = [0.00000001,0.0001, 000001];
ub = [10000,10000,10000];
AA = [];
b1 = [];
Aeq = [];
beq = [];
options = optimoptions('fmincon','Display','off','Algorithm','sqp');

for i=1:length(a)
    ai = a(i);
    bi = b(i);

    if(ai ~= bi)
        M1 = fmincon(fun,x0,AA,b1,Aeq,beq,lb,ub,@con,options);
        M(i) = -fun(M1);
        A(i) = ai;
        B(i) = bi;
        M(i) = Kvco*vpasolve(0.5*pi*x/(x*asin(x)+sqrt(1-x^2)) - M(i));
        disp(i/length(a));
    end
end

plot3(A, B, M);

function [c,ceq] = con(x)
c(1) = -(-ai^4*x(2) - bi^4 + 2*ai^2- ai^4*x(1) + bi^2*ai^2*x(3));
c(2) = -(1-bi^2*x(3) - 2*bi^2*x(2) - ai^2*x(3)- 2*bi^2+ 4*bi*ai*x(3)- 2*ai^2*x(1));
c(3) = -(x(3)-x(2)-1-x(1));
ceq = [];
end
end