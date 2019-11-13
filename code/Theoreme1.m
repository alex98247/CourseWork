global a b K;
taoP1=10^(-4);
taoP2=10^(-4);

hi=0.25;
eps=0.25;
tau=0.25;
delta=0.25;

a = taoP1+taoP2;
b = taoP1*taoP2;
%fprintf("a = % \n", a);
%fprintf("b = % \n", b);

%disp(hi-eps-tau);
%disp(2*tau*a-hi*b);

numerator = 1;
denominator = [taoP1*taoP2, taoP1+taoP2, 1];

X = -100:10^(-5):100;
K = @(x) 1./polyval(denominator, x);
plot(real(hi*K(X*1i)-eps*conj(K(X*1i)).*K(X*1i)-tau*(conj(K(X*1i)-X*1i)).*(K(X*1i) + X*1i)));
disp(4*eps*delta/hi^2);
t = 6;
temp = (real(hi*K(t*1i)-eps*conj(K(t*1i))*K(t*1i)-tau*(conj(K(t*1i)-t*1i))*(K(t*1i) + t*1i)));
disp(temp);

test = [tau*b^2, 0, tau*a^2-2*tau*b, 0, hi*b+tau, 0, hi-eps-tau];
disp(polyval(test, t)/((1-b*t^2)^2 + a^2*t^2));

%Find max
fun = @(x)-(4*x(1)*x(2)/(x(3))^2);
x0 = [1,0.000001,0.002,0.01];
lb = [0.00000001,0.0000001,0.001,0.0000001];
ub = [1000,1000,50,50];
A = [1,1,-1,1;0,0,0,0;0,0,0,0;0,0,0,0];
b1 = [0,0,0,0];
Aeq = [];
beq = [];
options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
%x = fmincon(fun,x0,A,b1,Aeq,beq,lb,ub,@con,options);

xs = fmincon(fun,x0,A,b1,Aeq,beq,lb,ub,@con1,options);

%disp(x);
%disp(4*x(1)*x(2)/(x(3))^2);
%disp(x(1)+x(2)-x(3)+x(4));

disp(xs);
disp(4*xs(1)*xs(2)/(xs(3))^2);
disp(xs(1)+xs(2)-xs(3)+xs(4));

function [c,ceq] = con1(x)
global a b K;
x1=(-2*(x(4)*a^2-2*x(4)*b-x(2)*b^2) + sqrt(((2*(x(4)*a^2-2*x(4)*b-x(2)*b^2))^2-12*(x(4)*b^2)*(x(3)*b+x(4)-x(2)*a^2+2*x(2)*b))))/(6*(x(4)*b^2));
%x2=(-2*(x(4)*a^2-2*x(4)*b-x(2)*b^2) - sqrt(((2*(x(4)*a^2-2*x(4)*b-x(2)*b^2))^2-12*(x(4)*b^2)*(x(3)*b+x(4)-x(2)*a^2+2*x(2)*b))))/(6*(x(4)*b^2));
c(1) = -((2*(x(4)*a^2-2*x(4)*b-x(2)*b^2))^2-12*(x(4)*b^2)*(x(3)*b+x(4)-x(2)*a^2+2*x(2)*b));
c(2) = -real(x(3)*K(x1*1i)-x(1)*conj(K(x1*1i))*K(x1*1i)-x(4)*(conj(K(x1*1i)-x1*1i))*(K(x1*1i) + x1*1i));
disp("Value constraint");
disp(c);
ceq = [];
end

function [c,ceq] = con(x)
global a b;
c = (2*(x(4)*a^2-2*x(4)*b-x(2)*b^2))^2-12*(x(4)*b^2)*(x(3)*b+x(4)-x(2)*a^2+2*x(2)*b);
disp("Value constraint");
disp(c);
ceq = [];
end