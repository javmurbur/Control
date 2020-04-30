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
erle.yaw = 0;
%% Variaciones de ángulo 
erle.r = 0;
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
erle.yaw_des = 0;
erle.yaw_des_filt = 0;
erle.yaw_des_filt_1 = 0;

% Control del yaw
% [TI,TD,KP,KI,KD] = calculo_PID(342.98,0.17,0);
% F_PID = tf([1],[0.5 1]);
erle.yaw_TI = 0.17;
erle.yaw_TD = 0;
erle.yaw_TI_F = 0.5;
erle.yaw_KP = 58.3066;
erle.yaw_KI = 342.9800;
erle.yaw_KD = 0;
erle.r_max = 45;
erle.yaw_Int_ek = 0;
erle.yaw_ek_1 = 0;

% Salidas del control de actitud
erle.r_des = 0;

%% Control de variación de ángulo

% Control de variación del yaw
% [TI,TD,KP,KI,KD] = calculo_PID(39.08,0.1,0);
erle.r_TI = 0.1;
erle.r_TD = 0;
erle.r_KP = 3.908;
erle.r_KI = 39.08;
erle.r_KD = 0;
erle.U4_max = 2*erle.Kd*erle.w_max^2;
erle.U4_min = -2*erle.Kd*erle.w_max^2;
erle.r_Int_ek = 0;
erle.r_d = 0;

% Salidas del rate control
erle.U4 = 0;

%% Variables para graficar
erle.indice = 1;
erle.time_plot = [0:erle.Tm:erle.T_simulacion];
erle.r_plot =   [0:erle.Tm:erle.T_simulacion];
erle.U4_plot =   [0:erle.Tm:erle.T_simulacion];
erle.yaw_des_plot = [0:erle.Tm:erle.T_simulacion];
erle.yaw_plot = [0:erle.Tm:erle.T_simulacion];