clc;
clear all;

%Trapeziodal
yplus = 0:0.01:80;
k = 0.41;
A = 26;
h = 0.01;
uplus(1) = 0;
for i = 1:1:8001
    a = yplus(i)^3;
    b = exp(-yplus(i)/A);
    B(i) = 4*k*a*(1-b);
    f(i) = 2/(1+sqrt(1+B(i)));
end
for i = 1:1:8000
    uplus(i+1) = uplus(i) + 0.5*h*(f(i+1)+f(i));
end
plot(yplus,uplus);
grid on;