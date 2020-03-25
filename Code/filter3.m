syms x a b c d p q r t s ai bi a1 a2 b1 b2 real

%filter 3, tau = 0, kappa = 1, epsilon = 1 - delta
disp('filter 3, tau = 0, kappa = 1, epsilon = 1 - delta');
K = (1+a1*b1*x+a2*b2*x^2)/(1+a1*x+a2*x^2);
Ki = subs(K, x, 1i*x);
f = Ki*conj(Ki);
f1 = conj((Ki-1i*x)*(Ki+1i*x));
f2 = p*Ki - q*f - r*f1 - s;
f3 = subs(f2, r, 0);
f4 = subs(f3, p, 1);
f5 = subs(f4, q, 1-s);
disp(collect(simplify(real(f5))));