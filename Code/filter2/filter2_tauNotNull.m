function filter2_all()
x = sym('x');

%For tau != 0
[taoP1,taoP2] = meshgrid(0.001:0.01:1,0.001:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1);
b = grid(:, 2);

M = [];
A = [];
B = [];
fun = @(x)-(4*x(1)*x(2)/(x(3))^2);
x0 = [0.005, 0.0005, 1];
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
            disp(M1);
            disp(i*100/length(a));
    end
end
plot3(A, B, M, '.');

function [c,ceq] = con(x)
    A1 = (-bi^4*x(1)-bi^4+2*ai^2-ai^4*x(2)+ai^2*bi^2*x(3))/ai^4;
    B1 = (1-bi^2*x(3)-2*bi^2*x(1)-ai^2*x(3)-2*bi^2+4*ai*bi*x(3)-2*ai^2*x(2))/ai^4;
    C1 = (x(3)-x(1)-1-x(2))/ai^4;
    Q = (A1-3*B1)/9;
    R = (2*A1^3-9*A1*B1+27*C1)/54;
    S = Q^3-R^2;
    if(S>0)
        fi = (acos(R/sqrt(Q^3)))/3;
        c(1) = -(-2*sqrt(Q)*cos(fi) - A1/3);
        c(2) = -(-2*sqrt(Q)*cos(fi+2*pi/3) - A1/3);
        c(3) = -(-2*sqrt(Q)*cos(fi-2*pi/3) - A1/3);
    end
    if (S<0)
        if(Q>0)
            fi = (acosh(abs(R)/sqrt(Q^3)))/3;
            c(1) = -(-2*sign(R)*sqrt(Q)*cosh(fi) - A1/3);
            c(2) = 0;
            c(3) = 0;
        end
        if(Q<0)
            fi = (asinh(abs(R)/sqrt(abs(Q)^3)))/3;
            c(1) = -(-2*sign(R)*sqrt(abs(Q))*sinh(fi) - A1/3);
            c(2) = 0;
            c(3) = 0;
        end
        if(Q==0)
            c(1) = -(-(C1-A1^3/27)^(1/3) - A1/3);
            c(2) = 0;
            c(3) = 0;
        end
    else
        c(1) = -(-2*(R)^(1/3)- A1/3);
        c(2) = 0;
        c(3) = 0;
    end
ceq = [];
end
end