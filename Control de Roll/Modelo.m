%% Cálculo del modelo
Ixx = 0.0347563;% (Kg*m^2)
G = tf([1],[Ixx 0]);
%% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 13.093 * (1+0.1*s)/s
C = tf([1.3093 13.093],[1 0]);
[TI,TD,KP,KI,KD] = calculo_PID(13.093,0.1,0);
% Filtro
F = tf([1],[0.1 1]);
I = tf([1],[1 0]);

Gbc = ((C*G)/(1+C*G))*I;
rltool(Gbc)

% %% Controlador PID
% % C_PID = 175.4*(1+0.2*s)/s
% [TI,TD,KP,KI,KD] = calculo_PID(175.4,0.2,0);
% F_PID = tf([1],[0.25 1]);
% TI_F = 0.25;
% % tiempo subida = 0.54(segundos)