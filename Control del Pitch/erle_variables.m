global erle;

erle.T_simulacion = 5;%(segundos)
erle.T_escalon = 2;%(segundios)
erle.Tm = 0.01;

%% Parámetros del motor
erle.Kt = 8.5486e-6;
erle.w_max = 838*(180/pi); % (rad/s)
erle.w_min = 0;
erle.Jr = 2.409e-4;
%% Angulos de inclinación
erle.pitch = 0;
%% Variaciones de ángulo 
erle.q = 0;
%% Parámetros físicos
erle.Kd = 8.06428e-5;
erle.Kdx = 0;
erle.Kdy = 0;
erle.Kdz = 0;
erle.l = 0.141; % (m)
erle.m = 1.12; % (Kg)
erle.Ixx = 0.0347563;% (Kg*m^2)
erle.Iyy = 0.0458929;% (Kg*m^2)
erle.Izz = 0.0977;   % (Kg*m^2)
erle.g = 9.81;

%% Control de actitud
%Entradas 
erle.pitch_des = 0;
erle.pitch_des_filt = 0;
erle.pitch_des_filt_1 = 0;

% Control del pitch
% [TI,TD,KP,KI,KD] = calculo_PID(172.18,0.2,0);
% F_PID = tf([1],[0.25 1]);
erle.pitch_TI = 0.2;
erle.pitch_TD = 0;
erle.pitch_TI_F = 0.25;
erle.pitch_KP = 34.4360;
erle.pitch_KI = 172.1800;
erle.pitch_KD = 0;
erle.q_max = 45;
erle.pitch_Int_ek = 0;
erle.pitch_ek_1 = 0;

% Salidas del control de actitud
erle.q_des = 0;

%% Control de variación de ángulo

% Control de variación del pitch
% [TI,TD,KP,KI,KD] = calculo_PID(18.357,0.1,0);
erle.q_TI = 0.1;
erle.q_TD = 0;
erle.q_KP = 1.8357;
erle.q_KI = 18.3570;
erle.q_KD = 0;
erle.U3_max = sqrt(2)*erle.l*erle.Kt*erle.w_max^2;
erle.U3_min = -sqrt(2)*erle.l*erle.Kt*erle.w_max^2;
erle.q_Int_ek = 0;
erle.q_d = 0;

% Salidas del rate control
erle.U3 = 0;

%% Variables para graficar
erle.indice = 1;
erle.time_plot = [0:erle.Tm:erle.T_simulacion];
erle.q_plot =   [0:erle.Tm:erle.T_simulacion];
erle.U3_plot =   [0:erle.Tm:erle.T_simulacion];
erle.pitch_des_plot = [0:erle.Tm:erle.T_simulacion];
erle.pitch_plot = [0:erle.Tm:erle.T_simulacion];