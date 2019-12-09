function filter1()
t = sym('t');

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

M = [];
fun = @(x)-(abs(1-x));
x0 = 0.5;
lb = 0;
ub = 1;
A = [];
b1 = [];
Aeq = [];
beq = [];
for i=1:length(a)
    ai = a(i);
    bi = b(i);
    options = optimoptions('fmincon','Display','off','Algorithm','sqp');
    
    M1 = fmincon(fun,x0,A,b1,Aeq,beq,lb,ub,@discriminant,options);
    M(i) = -fun(M1);
    %M(i) = 1000*vpasolve(0.5*pi*t/(t*asin(t) + sqrt(1-t^2)) == M(i), t);
    disp(i/length(a))
end

plot3(grid(:, 1), grid(:, 2), M);
%axis equal
%xlabel('taoP1')
%ylabel('taoP2')
%zlabel('f')

function [c,ceq] = discriminant(x)
c = (x*ai^2 + (x/2 - 1/2)*bi^2 - 2*x*bi)^2 + 4*bi^2*x*((1/2 - x/2)*ai^2 + bi - x + 2*bi*(x/2 - 1/2));
ceq = [];
end
end