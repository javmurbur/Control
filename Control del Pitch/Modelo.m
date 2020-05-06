%% Modelo para el control de p
Iyy = 0.0458929;% (Kg*m^2)
G = tf([1],[Iyy 0]);
% rltool(G);

% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 18.357 * (1+0.1*s)/s
% tiempo de subida = 0.195 (segundos)

[TI,TD,KP,KI,KD] = calculo_PID(18.357,0.1,0);
C = tf([1.8357  18.357 ],[1 0]);
F = tf([1],[0.1 1]);
I = tf([1],[1 0]);

%% Modelo para el control del Pitch
Gbc = ((C*G)/(1+C*G))*I;
rltool(Gbc)

% Controlador PID
% C_PID = 172.18*(1+0.2*s)/s
[TI,TD,KP,KI,KD] = calculo_PID(172.18,0.2,0);
F_PID = tf([1],[0.25 1]);
TI_F = 0.25;
% tiempo subida = 0.54(segundos)