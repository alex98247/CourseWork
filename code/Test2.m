function Test2()
syms x a b c d p q r t s ai bi real
%p = kappa
%q = epsolon
%r = tau
%s = delta
D = (r*a^2-2*r*b - s*b^2)^2-4*r*b^2*(-p*b+r-s*a^2 + 2*s*b);
Ds = subs(D, p, 1);
Ds1 = subs(Ds, s, (1-r)/2);
disp(simplify(Ds1));

K = 1/((1+a*x)*(1+b*x)*(1+c*x));
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
disp(simplify(real(f2)));

K = (1+2*a*x+a^2*x^2)/(1+2*b*x+b^2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
disp(simplify(real(f3)));


f = 4*s*(1 - b) - 4*s^2*(a^2 -2*b +1);
f = subs(f, s, (1-b)/(2*(a^2 - 2*b +1)));
disp(simplify(real(f)));
end