global A b c h Kvco omegaEFree

taoP1=10^(-3);
taoZ1=10^(-4);
Kvco=250;
omegaEFree = 0;
numerator = [taoZ1^2, 2*taoZ1, 1];
denominator = [taoP1^2, 2*taoP1, 1];
G = tf(numerator,denominator);
[A,b,c,h] = ssdata(G);
disp(A);
disp(b);
disp(c);
disp(h);
ddeoptions=ddeset('RelTol', 1e-8, 'AbsTol', 1e-15);
sol = ode23(@ddun, [0, 2*pi], [0, 0, 0.01], ddeoptions);
plot3(sol.y(1, :),sol.y(2, :),sol.y(3, :));
%------------------------------------------------------------------
function dydt = ddun(t,y)
global A b c h Kvco omegaEFree

dydt=zeros(3,1);
dydt(1:2)=A*y(1:2) + b*sin(y(3));
dydt(3)=omegaEFree-Kvco*(c*y(1:2)+h*sin(y(3)));
end
