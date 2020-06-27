%% Modelo para el control de p
Iyy = 0.0458929;% (Kg*m^2)
G_q = tf([1],[Iyy 0]);
% rltool(G);

% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 18.357 * (1+0.1*s)/s
% tiempo de subida = 0.195 (segundos)

% [TI,TD,KP,KI,KD] = calculo_PID(18.357,0.1,0);
C_q = tf([1.8357  18.357 ],[1 0]);
% F = tf([1],[0.1 1]);
I = tf([1],[1 0]);

%% Modelo para el control del Pitch
G_pitch = ((C_q*G_q)/(1+C_q*G_q))*I;
% rltool(Gbc)

% Controlador PID
% C_PID = 172.18*(1+0.2*s)/s
C_pitch = tf(172.18*[0.2 1],[1 0])
% [TI,TD,KP,KI,KD] = calculo_PID(172.18,0.2,0);
% F_PID = tf([1],[0.25 1]);
% TI_F = 0.25;
% tiempo subida = 0.54(segundos)

Gx = ((G_pitch * C_pitch)/(1 + G_pitch * C_pitch))*9.81*I*I
% rltool(Gx);