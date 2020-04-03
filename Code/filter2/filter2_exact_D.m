function [M, A, B] = filter2_exact_D()

%For tau = 0
[taoP1,taoP2] = meshgrid(0.0001:0.01:1,0.0001:0.01:1);
grid = [taoP1(:) taoP2(:)];

a = grid(:, 1);
b = grid(:, 2);

M = [];
A = [];
B = [];
fun = @(x)-(4*x(1)*x(2)/(x(3))^2);
x0 = [0.0000001, 0.000001, 1];

lb = [0.00000000001, 0.00000000001, 1];
ub = [10000,10000,10000];
options = optimoptions('fmincon','Display','off','Algorithm','sqp');

for i=1:length(a)
    ai = a(i);
    bi = b(i);

    if(ai ~= bi)
        [~, M1] = fmincon(fun,x0,[],[],[],[],lb,ub,@con,options);
            M(i) = -M1;
            A(i) = ai;
            B(i) = bi;
            disp(i*100/length(a));
    end
end

plot3(A, B, M, '.');
axis equal
xlabel('tauP1')
ylabel('tauZ1')
zlabel('nu^2')

%a > 0, c > 0, D < 0
function [c,ceq] = con(x)
c(1) = (ai^2*x(3)+ 2*ai^2*x(1)+ bi^2*x(3)+ 2*bi^2*x(2)- 4*ai*bi*x(3))^2-4*(ai^4*x(1)+ bi^4*x(2)- ai^2*bi^2*x(3))*(x(1) - x(3) + x(2));
c(2) = -(-ai^4*x(1)- bi^4*x(2)+ ai^2*bi^2*x(3));
c(3) = -(-x(1) + x(3) - x(2));
c(4) = -x(1);
c(5) = -x(2);
c(6) = -x(3);
ceq = [];
end
end