function [M] = maximize(taoP1, taoP2)

%For tau = 0
%a > 0
%c > 0
%b > 0
z = taoP1/taoP2;
q = 2*z - 1/2 - z^2/2;
x12 = 1/(1+z^2);
y12 = z^2/(1+z^2);

x13 = (1-q)/(1-z^2);
y13 = (q-z^2)/(1-z^2);

x23 = (z^2-q)/(z^4-z^2);
y23 = z^2 - z^4*(z^2-q)/(z^4-z^2);

y2 = 1/z^2;
y3 = q/z^2;

f1 = @(x) x*(1-x);
f2 = @(x) x*(z^2-z^4*x);
f3 = @(x) x*(q-z^2*x);

M = 0;
if q > 0
if q < 1
    if (0-y3)^2 +(q-0)^2 < (0-x23)^2 + (q-y23)^2
        %Пересечение с OX
        M = f3(fminbnd(@(x) -f3(x), 0, y3));
    else
        M = max([f3(fminbnd(@(x) -f3(x), 0, x13)), f2(fminbnd(@(x) -f2(x), x13, y2))]);
    end
else 
    if (0-x12)^2 + (1-y12)^2 < (0-x13)^2 + (1-y13)^2
        M = max([f1(fminbnd(@(x) -f1(x), 0, x12)), f2(fminbnd(@(x) -f2(x), x12, y2))]);
    else
        if (x13-x23)^2 + (y13-y23)^2 < (x13-y3)^2 + (y13)^2
            M = max([f1(fminbnd(@(x) -f1(x), 0, x13)), f3(fminbnd(@(x) -f3(x), x13, x23)), f2(fminbnd(@(x) -f2(x), x23, y2))]);
        else
            M = max([f1(fminbnd(@(x) -f1(x), 0, x13)), f3(fminbnd(@(x) -f3(x), x13, y3))]);
        end
    end
end
end