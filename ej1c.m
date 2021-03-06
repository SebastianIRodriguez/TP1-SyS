clear, clc

%Constantes del problema
R=12;
L=1e-3;
C=1e-6;

%Condiciones iniciales
x1(1)=0;
x2(1)=0;

%Pasos de integracion
T1 = 2*pi*sqrt(L*C) / (100 * sqrt( 1 - (C*(R^2) / (4*L)) ) );
T2 = 2*pi*sqrt(L*C) / (15 * sqrt( 1 - (C*(R^2) / (4*L)) ) );
T=T2;

%Definicion de Entrada
anchoPulso = round(3e-3/T);
u = [ones(anchoPulso,1); zeros(anchoPulso,1)];

%Integracion numerica
for n=2:1:length(u)
    x1(n) = x2(n-1)*T + x1(n-1);
    x2(n) = x2(n-1) + (u(n-1) - R*x2(n-1) - x1(n-1)/C )*T/L;
end

%Calculo expresiones pedidas
uc = x1 / C;
il = x2;

%Graficas
abcisas = 0:T:(6e-3)-T;

subplot(2,1,1), plot(abcisas, uc);
title('Tension del Capacitor');
ylabel('U_c [V]');
xlabel('t [ms]');

subplot(2,1,2), plot(abcisas, il);
title('Corriente por la Inductancia');
ylabel('I_l [A]');
xlabel('t [ms]');