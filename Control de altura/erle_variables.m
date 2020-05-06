global erle;

erle.T_simulacion = 10;%(segundos)
erle.T_escalon = 2;%(segundios)
erle.Tm = 0.01;

%% Parámetros del motor
erle.Kt = 8.5486e-6;
erle.w_max = 838*(180/pi); % (rad/s)
erle.w_min = 0;
erle.Jr = 2.409e-4;

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

%% Control de variación de ángulo
erle.Z_des = 0;
erle.Z_des_filt = 0;
erle.Z_des_filt_1 = 0;
erle.Z = 0;
erle.Z_d = 0;
% erle.Z_dd = 0;

% Control de variación del roll
% C = zpk([-10 -5],[0],2909.8);
%F = zpk([],[-1],1);
% [TI,TD,KP,KI,KD] = calculo_PID(2909.8,0.1,0.2)
% Control de altura
erle.Z_TI = 2;
erle.Z_TI_F = 1;
erle.Z_TD = 0.5;
erle.Z_KP = 15.1200;
erle.Z_KI = 7.5600;
erle.Z_KD = 7.5600;
erle.U1_max = erle.Kt*4*erle.w_max^2;
erle.U1_min = 0;
erle.Z_KI_lim = 0;
erle.Z_Int_ek = 0;
erle.Z_ek_1 = 0;

% Salidas del rate control
erle.U1 = 0;

%% Variables para graficar
erle.indice = 1;
erle.time_plot = [0:erle.Tm:erle.T_simulacion];
erle.U1_plot =   [0:erle.Tm:erle.T_simulacion];
erle.Z_des_plot = [0:erle.Tm:erle.T_simulacion];
erle.Z_d_plot = [0:erle.Tm:erle.T_simulacion];
erle.Z_plot = [0:erle.Tm:erle.T_simulacion];
erle.Z_dd_plot = [0:erle.Tm:erle.T_simulacion];