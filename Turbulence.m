%Plotting Free Shear FLow of Round Jet
%<uv>/(Uo^2) vs zeta and eta 
clc;
clear all;

s = 0.094;
vt = 0.028;
a = 47;
zeta = 0:0.01:5;
eta = zeta*s;
for i=1:1:501
    y(i) = eta(i)/(2*((1+a*eta(i)^2)^3));
end

%subplot(121);
plot(zeta,y);
title('<uv>/(Uo^2) vs \zeta');
xlabel('\zeta');
ylabel('<uv>/(Uo^2)');
grid on;
%axis tight;
%subplot(122);
figure;
plot(eta,y);
title('<uv>/(Uo^2) vs \eta');
xlabel('\eta');
ylabel('<uv>/(Uo^2)');
grid on;
%axis tight;