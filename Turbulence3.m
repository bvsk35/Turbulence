clear all;
clc;

Re_lambda = 10^3;
C = 1.5;
p0 = 2;
beta = 5.2;
c_L = 6.78;
c_eta = 0.4;
A = ((27*(Re_lambda^6)*(3^1.5))/(8000*(2^1.5)))^0.25;
x = [(5*pi)/A (30*pi)/A pi/30 (2*pi)];
for i = 1:1:4
    f_L(i) = ((A*x(i))/((c_L+((A*x(i))^2))^0.5))^(11/3);
    f_eta(i) = exp(-beta*((((x(i)^4)+(c_eta^4))^0.25)-c_eta));
    e(i) = C*(x(i)^(-5/3))*f_L(i)*f_eta(i);
    d(i) = 2*C*(x(i)^(1/3))*f_L(i)*f_eta(i);
end
