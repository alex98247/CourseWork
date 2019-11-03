taoP1=10^(-3);
taoZ1=10^(-4);

numerator = [1, -2*taoZ1, taoZ1^2];
denominator = [1, -2*taoP1, taoP1^2];
K = poly(numerator)/poly(denominator);

X = -0.25:10^(-5):0.25;
K = @(x) polyval(numerator, x)./polyval(denominator, x);
plot(real(K(X*i)));
