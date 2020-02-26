function equilibrium_points()
global A b c h Kvco omegaEFree
syms y teta;

[teta]= solve (omegaEFree/Kvco + c*A^(-1)*b*sin(y) - h*sin(y));
disp(teta);
disp(A^(-1)*b*sin(teta(1,1)));
end
