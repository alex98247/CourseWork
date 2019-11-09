global a b;
taoP1=10^(-4);
taoP2=10^(-4);

hi=10^(-7);
eps=10^(-8);
tau=10^(-5);
delta=1;

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
%disp(4*eps*delta/hi^2);
t = 6;
temp = (real(hi*K(t*1i)-eps*conj(K(t*1i))*K(t*1i)-tau*(conj(K(t*1i)-t*1i))*(K(t*1i) + t*1i)));
disp(temp);

test = [tau*b^2, 0, tau*a^2-2*tau*b, 0, hi*b+tau, 0, hi-eps-tau];
disp(polyval(test, t)/((1-b*t^2)^2 + a^2*t^2));

%Find max
fun = @(x)4*x(1)*x(2)/(x(3))^2;
x0 = [1/4,1/4,1/4,1/4];
lb = [0,0,1,0];
ub = [0.5,0.8,0,0];
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = @circlecon;
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
x = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);
disp(x);
function [c,ceq] = circlecon(x)
global a b;
c = (2*(x(4)*a^2-2*x(4)*b-x(2)*b^2))^2-12*(x(4)*b^2)*(x(3)*b+x(4)-x(2)*a^2+2*x(2)*b);
ceq = [];
end