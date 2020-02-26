function Test2()
syms x a b c d p q r t s ai bi a1 a2 b1 b2 real
%p = kappa
%q = epsolon
%r = tau
%s = delta
D = (r*a^2-2*r*b - s*b^2)^2-4*r*b^2*(-p*b+r-s*a^2 + 2*s*b);
Ds = subs(D, p, 1);
Ds1 = subs(Ds, s, (1-r)/2);
%disp(simplify(Ds1));

%filter 3, tau not null
disp('filter 3, tau not null');
K = (1+a1*b1*x+a2*b2*x^2)/(1+a1*x+a2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
disp(collect(simplify(real(f2))));

%filter 3, tau = 0
disp('filter 3, tau = 0');
K = (1+a1*b1*x+a2*b2*x^2)/(1+a1*x+a2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
disp(collect(simplify(real(f3))));

%filter 3, tau = 0, kappa = 1, epsilon = 1 - delta
disp('filter 3, tau = 0, kappa = 1, epsilon = 1 - delta');
K = (1+a1*b1*x+a2*b2*x^2)/(1+a1*x+a2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
f4 = subs(f3, p, 1);
f5 = subs(f4, q, 1-s);
disp(collect(simplify(real(f5))));

%filter2, tau = 0, kappa = 1, epsilon = 1 - delta
disp('filter2, tau = 0, kappa = 1, epsilon = 1 - delta');
K = (1+2*a*x+a^2*x^2)/(1+2*b*x+b^2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj(Ki-1i*x)*(Ki+1i*x);
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
f4 = subs(f3, p, 1);
f5 = subs(f4, q, 1-s);
disp(collect(simplify(real(f5))));


f = 4*s*(1 - b) - 4*s^2*(a^2 -2*b +1);
f = subs(f, s, (1-b)/(2*(a^2 - 2*b +1)));
%disp(simplify(real(f)));

%Discriminant for filter 2
disp('Discriminant for filter 2');
f = (4*a*b-a^2-2*a^2*q-b^2-2*b^2*s)^2-4*(a^2*b^2-a^4*q-b^4*s)*(1-q-s);
disp(expand(simplify(f)));
end