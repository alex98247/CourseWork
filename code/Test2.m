function Test2()
syms x a b c d p q r s ai bi real
%p = kappa
%q = epsolon
%r = tau
%s = delta
D = (r*a^2-2*r*b - s*b^2)^2-4*r*b^2*(-p*b+r-s*a^2 + 2*s*b);
Ds = subs(D, p, 1);
Ds1 = subs(Ds, s, (1-r)/2);
disp(simplify(Ds1));

K = (1+2*a*x+a^2*x^2)/(1+2*b*x+b^2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
f3 = subs(f3, a, ai);
f3 = subs(f3, b, bi);
disp(simplify(real(f3)));

K = (1+2*a*x+a^2*x^2)/(1+2*b*x+b^2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
disp(simplify(real(f3)));

end