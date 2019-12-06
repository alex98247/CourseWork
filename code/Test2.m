function Test2()
syms x a b c d p q r s real
%p = kappa
%q = epsolon
%r = tau
%s = delta
D = (r*a^2-2*r*b - s*b^2)^2-4*r*b^2*(-p*b+r-s*a^2 + 2*s*b);
Ds = subs(D, p, 1);
Ds1 = subs(Ds, s, (1-r)/2);
disp(simplify(Ds1));
end