clc;
clear all;

%central difference method
k = 0.41;
A = 26;
delta_yplus = 0.01;
uplus(1) = 0;
uplus(2) = 0.01;
yplus = 0:0.01:80;
for i=2:1:8000
    B = k*(yplus(i))*(1-exp(-yplus(i)/A));
    uplus(i+1) = (4*delta_yplus)/(1+sqrt(1+(4*B*B))) + uplus(i-1);
end
plot(yplus,uplus);
grid on;
hold on;
%viscous sublayer
for i = 1:1:1551
    vsuplus(i) = yplus(i);
    vsyplus(i) = yplus(i);
end
plot(vsyplus,vsuplus,'r');
grid on;
hold on;
%Log Law Region
B = 5.2;
for i = 1:1:6451
    llruplus(i) = (log(yplus(i+1550))/k) + B;
    llryplus(i) = yplus(i+1550);
end
plot(llryplus,llruplus,'g');
grid on;
xlabel('y^+');
ylabel('u^+(y^+)');
title('Mean Velocity vs Wall Units');
legend('u^+(y^+) = Van Direst Approximation','u^+(y^+) = y^+','u^+(y^+) = ln(y^+)/k + B','Location','southeast');







