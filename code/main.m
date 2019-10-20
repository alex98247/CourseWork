ddeoptions=ddeset('RelTol', 1e-8, 'AbsTol', 1e-8);
sol = ode23(@ddun, [0, 0.0001], [0, 0, pi], ddeoptions);
plot3(sol.y(1, :),sol.y(2, :),sol.y(3, :));
%------------------------------------------------------------------
function dydt = ddun(t,y)
Kvco=250;
taop1=10^(-3);
taoz1=10^(-4);
b=[0,1/taop1^2];
c=[(1/taop1^2 - taoz1^2/taop1^4),2*(taoz1/taop1^2 - taoz1^2/taop1^3)];
A=[0,1; 
   1/taop1^2, 2/taop1];
dydt=zeros(3,1);
dydt(1:2)=A*y(1:2) + (b*y(3))';
dydt(3)=0-Kvco*(c*y(1:2)+(taoz1^2/taop1^2)*sin(y(3)));
end
