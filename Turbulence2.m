clear all;
clc;

%Plot of Normalised Pope Spectrum 
Re_lambda = input('Enter Taylor Reynolds Number\n');
C = 1.5;
p0 = 2;
beta = 5.2;
c_L = 6.78;
c_eta = 0.4;
A = ((27*(Re_lambda^6)*(3^1.5))/(8000*(2^1.5)))^0.25;
%kappa*eta
% x = 10^-5:10^-5:10^0;
% a = length(x);
% for i = 1:1:a
%     f_L(i) = ((A*x(i))/((c_L+((A*x(i))^2))^0.5))^(11/3);
%     f_eta(i) = exp(-beta*((((x(i)^4)+(c_eta^4))^0.25)-c_eta));
%     e(i) = C*(x(i)^(-5/3))*f_L(i)*f_eta(i);
% end
% loglog(x,e);
% grid on;
%and Dissipation Spectrum
x1 = 0:0.01:1.6;
a1 = length(x1);
for i = 1:1:a1
    f_L(i) = ((A*x1(i))/((c_L+((A*x1(i))^2))^0.5))^(11/3);
    f_eta(i) = exp(-beta*((((x1(i)^4)+(c_eta^4))^0.25)-c_eta));
    d(i) = 2*C*(x1(i)^(1/3))*f_L(i)*f_eta(i);
end
plot(x1,d);
grid on;
