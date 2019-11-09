taoP1=10^(-3);
taoZ1=10^(-4);

hi=1;
eps=0.002;
tau=5;
delta=1;

numerator = [1, 2*taoZ1, taoZ1^2];
denominator = [1, 2*taoP1, taoP1^2];
K = poly(numerator)/poly(denominator);

X = -0.25:10^(-5):0.25;
K = @(x) polyval(numerator, x)./polyval(denominator, x);
plot(real(hi*K(X*i)-eps*conj(K(X*i)).*K(X*i)-tau*(conj(K(X*i))+X*i).*(K(X*i) + X*i)));
disp(4*eps*delta/hi^2);
