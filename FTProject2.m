clc;
clear all;

%Reading the text file
[j, xj, yj, cp, ue] = textread('naca.dat', '%f %f %f %f %f', -1);

%Parameters
Re_c = 6.67*(10^6);
c = 1;
visc = 1.5*(10^-5);
U_infinity = 100.05;

%Laminar Flow, xj=[92,141]
stheta(1) = ((0.075*visc*(xj(93)-xj(92)))/(ue(93)-ue(92)));
theta(1) = sqrt(stheta(1));
lamda(1) = (stheta(1)*(ue(93)-ue(92)))/(visc*(xj(93)-xj(92)));
for i = 1:1:50
    f(i) = (0.45*visc)/ue(i);
end
for i = 1:1:49
    stheta(i+1) = stheta(i) + (0.5*(f(i+1)+f(i))*(xj(92+i)-xj(91+i)));
    theta(i+1) = sqrt(stheta(i+1));
    lamda(i+1) = (stheta(i+1)*(ue(i+93)-ue(i+91)))/(visc*(xj(i+93)-xj(i+91)));
end
for i = 1:1:50
    if lamda(i)<0.1 && 0<lamda(i)
        H(i) = 2.61 - (3.75*lamda(i)) + (5.24*lamda(i)*lamda(i));
        delta_star(i) = H(i)*theta(i);
    elseif lamda(i)<0 && -0.1<lamda(i)
        H(i) = 2.088 + (0.0731)/(lamda(i)+0.14);
        delta_star(i) = H(i)*theta(i);
    else
        H(i) = H(i-1);
        delta_star(i) = H(i)*theta(i);
    end
end
%Turbulent Flow, xj=[142,183]
%Calculation for 142
H(50) = 1.4;
Re_theta = (ue(141)*theta(50))/(visc);
Cf = (0.246)/((10^(0.678*H(50)))*(Re_theta^0.268));
G = (3.0445) + ((0.8702)/((H(50)-1.1)^1.2721));
D = (-1.10698)/((H(50)-1.1)^2.2721);
C = (0.0299)/(theta(50)*((G-3)^0.6169));
B = (G*Cf)/(theta(50)*2);
A = ((1+H(50))*(G)*(ue(142)-ue(141)))/((ue(141))*(xj(142)-xj(141)));
E = (A-B+C)/(D);
H(51) = (E*(xj(142)-xj(141))) + (H(50));
F = (2+H(50))*(theta(50)/ue(141))*((ue(142)-ue(141))/(xj(142)-xj(141)));
I = (Cf*0.5)- F;
theta(51) = (I*(xj(142)-xj(141))) + (theta(50));
delta_star(51) = H(51)*theta(51);
delta(1) = (G*theta(51)) + delta_star(1);
Gstore(1) = G;
GDstore(1) = D;
%Calculation from 143 to 183
for i = 1:1:41
    Re_theta = (ue(i+141)*theta(i+50))/(visc);
    Cf = (0.246)/((10^(0.678*H(i+50)))*(Re_theta^0.268));
    G = (3.0445) + ((0.8702)/((H(i+50)-1.1)^1.2721));
    D = (-1.10698)/((H(i+50)-1.1)^2.2721);
    C = (0.0299)/(theta(i+50)*((G-3)^0.6169));
    B = (G*Cf)/(theta(i+50)*2);
    A = ((1+H(i+50))*(G)*(ue(i+142)-ue(i+141)))/((ue(i+141))*(xj(i+142)-xj(i+141)));
    E = (A-B+C)/(D);
    H(i+51) = (E*(xj(i+142)-xj(i+141))) + (H(i+50));
    F = (2+H(i+50))*(theta(i+50)/ue(i+141))*((ue(i+142)-ue(i+141))/(xj(i+142)-xj(i+141)));
    I = (Cf*0.5)- F;
    theta(i+51) = (I*(xj(i+142)-xj(i+141))) + (theta(i+50));
    delta_star(i+51) = H(i+51)*theta(i+51);
    delta(i+1) = (G*theta(i+51)) + delta_star(i+51);
    Gstore(i+1) = G;
    GDstore(i+1) = D;
end
for i = 1:1:92
    x(i) = xj(91+i);
end
for i = 1:1:42
    y(i) = xj(i+141);
end
for i = 1:1:42
    z(i) = H(i+50);
    v(i) = delta(i);
end
plot(y,v);
grid on;
xlabel('x in m');
ylabel('\delta');
title('Boundary Layer Thickness vs Chord Length');
figure;
plot(x,theta);
grid on;
xlabel('x in m');
ylabel('\theta');
title('Momentum Thickenss vs Chord Length');
figure;
plot(x,delta_star);
grid on;
xlabel('x in m');
ylabel('\delta^*');
title('Displacement Thickenss vs Chord Length');
figure;
plot(z,GDstore);
grid on;
xlabel('H');
ylabel('d(G(H))/dH');
figure;
plot(z,Gstore);
grid on;
xlabel('H');
ylabel('H_1 = G(H)');



    












