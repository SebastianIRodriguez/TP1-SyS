clear, clc

%Constantes del problema
R=12;
L=1e-3;
C=1e-6;

%Condiciones iniciales
x1(1)=0;
x1(2)=0;
x2(1)=0;

%Frecuencias: [1000, 2000, 3000, 4000, 4500, 4700, 4800, 5000, 5100, 5300, 5500, 6000, 7000, 8000, 9000, 10000]
F=10000;

%Elegimos el paso de integracion T1 por ser mas preciso
T = 2*pi*sqrt(L*C) / (100 * sqrt( 1-C*R^2 / (4*L) ) );

%Definicion de señal de entrada
abscisas = 0:T:(6e-3)-T;
u = sin(2*pi*F*abscisas);

%Integracion numerica
for n=2:1:length(u)   
    x1(n) = x2(n-1)*T + x1(n-1);
    x2(n) = x2(n-1) + (u(n) - R*x2(n-1) - x1(n)/C )*T/L;
end

%Calculo de tension del capacitor
uc = x1 / C;

%Graficas, definimos posCorte, para no mostrar la region de la grafica que corresponde al regimen transitorio
posCorte=round(length(abscisas)/2);
plot(abscisas(posCorte:length(abscisas)),uc(posCorte:length(abscisas)));