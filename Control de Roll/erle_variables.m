global erle;

erle.T_simulacion = 5;%(segundos)
erle.T_escalon = 2;%(segundios)
erle.Tm = 0.01;
erle.Deg_Rad = pi/180;
erle.Rad_Deg = 180/pi;
%% Parámetros del motor
erle.Kt = 8.5486e-6;
erle.w_max = 838; % (rad/s)
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

%% Control de actitud
%Entradas 
erle.roll_des = 0;
erle.roll_des_filt = 0;
erle.roll_des_filt_1 = 0;

% Control del roll
% [TI,TD,KP,KI,KD] = calculo_PID(175.4,0.2,0);
% F_PID = tf([1],[0.2 1]);
erle.roll = 0;
erle.roll_TI = 0.2;
erle.roll_TD = 0;
erle.roll_TI_F = 0.25;
erle.roll_KP = 35.0800;
erle.roll_KI = 175.4000;
erle.roll_KD = 0;
erle.p_max = 45*erle.Deg_Rad;
erle.roll_Int_ek = 0;
erle.roll_ek_1 = 0;
% Salidas del control de actitud
erle.p_des = 0;
erle.p_des_1 = 0;

%% Control de variación de ángulo

% Control de variación del roll
% [TI,TD,KP,KI,KD] = calculo_PID(13.093,0.1,0)
erle.p = 0;
erle.p_TI = 0.1;
erle.p_TD = 0;
erle.p_KP = 1.3093;
erle.p_KI = 13.0930;
erle.p_KD = 0;
erle.U2_max = sqrt(2)*erle.l*erle.Kt*erle.w_max^2;
erle.U2_min = -sqrt(2)*erle.l*erle.Kt*erle.w_max^2;
erle.p_Int_ek = 0;
erle.p_d = 0;
erle.p_ek_1 = 0;
% Salidas del rate control
erle.U2 = 0;

%% Variables para graficar
erle.indice = 1;
erle.time_plot = [0:erle.Tm:erle.T_simulacion];
erle.p_plot =   [0:erle.Tm:erle.T_simulacion];
erle.U2_plot =   [0:erle.Tm:erle.T_simulacion];
erle.roll_des_plot = [0:erle.Tm:erle.T_simulacion];
erle.roll_plot = [0:erle.Tm:erle.T_simulacion];