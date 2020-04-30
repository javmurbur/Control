%% Modelo para el control de r
Izz = 0.0977;   % (Kg*m^2)
G = tf([1],[Izz 0]);

% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 39.08 * (1+0.1*s)/s
% tiempo de subida = 0.195 (segundos)
C = tf([3.908 39.08],[1 0])
[TI,TD,KP,KI,KD] = calculo_PID(39.08,0.1,0);
F = tf([1],[0.1 1]);
I = tf([1],[1 0]);

%% Modelo para el control del Yaw
Gbc = ((C*G)/(1+C*G))*I;
rltool(Gbc);

%% Controlador PID
% C_PID = 342.98*(1+0.17*s)/s
[TI,TD,KP,KI,KD] = calculo_PID(342.98,0.17,0);
F_PID = tf([1],[0.5 1]);
TI_F = 0.5;
% tiempo de subida = 1.1 (segundos)