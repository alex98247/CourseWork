syms x z; 
taop1=10^(-3);
taoz1=10^(-4);
[x, z] = solve (x*(1/taop1^2 - taoz1^2/taop1^4)+(taoz1^2/taop1^2)*sin(z), (1/taop1^2)*x+(1/taop1^2)*sin(z));
disp(x);
disp(z);