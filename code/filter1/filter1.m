function filter1()
t = sym('t');

[taoP1,taoP2] = meshgrid(0:0.01:1,0:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1)+grid(:, 2);
b = grid(:, 1).*grid(:, 2);

M = [];
A = [];
B = [];
fun = @(x)-((1-x)^2);
x0 = 0.5;
lb = 0;
ub = 1;
AA = [];
b1 = [];
Aeq = [];
beq = [];
for i=1:length(a)
    ai = a(i);
    bi = b(i);
    options = optimoptions('fmincon','Display','off','Algorithm','sqp');
    
    M1 = fmincon(fun,x0,AA,b1,Aeq,beq,lb,ub,@discriminant,options);
    if((M1*ai^2 + (M1/2 - 1/2)*bi^2 - 2*M1*bi) > 0)
        M(i) = -fun(M1);
        A(i) = ai;
        B(i) = bi;
        %M(i) = 1000*vpasolve(0.5*pi*t/(t*asin(t) + sqrt(1-t^2)) == M(i), t);
        disp(i/length(a))
    end
end

plot3(A, B, M, '.');
%axis equal
%xlabel('taoP1')
%ylabel('taoP2')
%zlabel('f')

function [c,ceq] = discriminant(x)
c(1) = -(x*ai^2 + (x/2 - 1/2)*bi^2 - 2*x*bi);
c(2) = -x;
c(3) = -(x*ai^2-2*x*bi - bi^2*(1-x)/2);
c(4) = -(-bi+x-ai^2*(1-x)/2 + 2*bi*(1-x)/2);
c(5) = x-1;
ceq = [];
end
end