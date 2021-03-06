clear, clc

[y, Fs] = audioread('./Datos_TP1_Problema2/datos_9.wav');

%Constantes del problema
Ts = 1 / Fs;
c = 343.2;
L = 0.2;

%Extraccion de las se?ales del archivo
canal1 = y(:,1);
canal2 = y(:,2);

%Correlacion entre las entradas de los microfonos
corr = xcorr(canal1, canal2);

%Ploteo Resultados
t = (-length(corr) / 2) : (length(corr) / 2) - 1;
subplot(3,1,1), plot(canal1);
subplot(3,1,2), plot(canal2);
subplot(3,1,3), plot(t, corr);

%Determinacion del angulo de incidencia
[~, i] = max(corr);
indexCentro = floor(length(corr) / 2) + 1;
deltaN = i - indexCentro;
deltaT = deltaN * Ts;
theta = asin(c * deltaT / L) * 180 / pi