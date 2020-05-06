clear all;
close all;
clc;

addpath Simulador

global erle;
% erle_variables;
init_plot;
plot_erle_model;

erle.contador = 0;

erle.T_simulacion = 10;% segundos
erle.T_escalon_roll = 2;%(segundios);
erle.T_escalon_pitch = 4;%(segundios);
erle.T_escalon_yaw = 7;%(segundios)

for time = 0:erle.Tm:erle.T_simulacion
    %% Referencias
    % Roll Señal de entrada
    if(time < erle.T_escalon_roll)
        erle.roll_des = 0;
    end
    if(time >= erle.T_escalon_roll)
        
        erle.Z_des = 1;
    end
    % Pitch Señal de entrada
        if(time < erle.T_escalon_pitch)
        erle.pitch_des = 0;
    end
    if(time >= erle.T_escalon_pitch)
        erle.roll_des = -2*erle.Deg_Rad;
        erle.pitch_des = -2*erle.Deg_Rad;
        
    end
    % Yaw Señal de entrada
        if(time < erle.T_escalon_yaw)
        erle.yaw_des = 0;
    end
    if(time >= erle.T_escalon_yaw)
        erle.roll_des = 0;
        erle.pitch_des = 0;
        erle.yaw_des = 0*erle.Deg_Rad;
    end
    %%  Lazo de control
  attitude_control;
  rate_control;
  saturacion_actuaciones;
  ecuaciones_dinamicas;
  
  if(erle.contador == 3)
  plot_erle;
  drawnow
    erle.contador = 0;
  end
  
    erle.contador = erle.contador + 1;
  
  %% Variables estáticas
  erle.Z_des_plot(erle.indice) = erle.Z_des;
  erle.roll_des_plot(erle.indice) = erle.roll_des*erle.Rad_Deg;
  erle.pitch_des_plot(erle.indice) = erle.pitch_des*erle.Rad_Deg;
  erle.yaw_des_plot(erle.indice) = erle.yaw_des*erle.Rad_Deg;
  erle.time_plot(erle.indice) = time;
%   [erle.X_dd_BF,erle.Y_dd_BF,erle.Z_dd_BF_plot(erle.indice)] = rotateGFtoBF(erle.X_dd,erle.Y_dd,erle.Z_dd,erle.roll,erle.pitch,erle.yaw);
  erle.indice = erle.indice + 1;
end
%% Gráficas
%Control de altura
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.Z_plot,erle.time_plot,erle.Z_des_plot);xlabel('tiempo(s)');ylabel('Z(m)');
subplot(2,1,2);
plot(erle.time_plot,erle.U1_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.Z_d_plot);title('Zd(m/s)');
figure;
plot(erle.time_plot,erle.Z_dd_plot);title('Zdd(m/s^2)');
%Control del roll
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.roll_plot,erle.time_plot,erle.roll_des_plot);xlabel('tiempo(s)');ylabel('roll(Deg)');
subplot(2,1,2);
plot(erle.time_plot,erle.U2_plot);legend('Señal de control(U2)');
figure;
plot(erle.time_plot,erle.p_plot);title('p(Deg/s)');
%Control del pitch
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.pitch_plot,erle.time_plot,erle.pitch_des_plot);xlabel('tiempo(s)');ylabel('pitch(deg)');
subplot(2,1,2);
plot(erle.time_plot,erle.U3_plot);legend('Señal de control(U3)');
figure;
plot(erle.time_plot,erle.q_plot);title('q(Deg/s)');
%Control del yaw
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.yaw_plot,erle.time_plot,erle.yaw_des_plot);xlabel('tiempo(s)');ylabel('yaw(deg)');
subplot(2,1,2);
plot(erle.time_plot,erle.U4_plot);legend('Señal de control(U4)');
figure;
plot(erle.time_plot,erle.r_plot);title('r(Deg/s)');
% Posiciones
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.X_plot);xlabel('tiempo(s)');ylabel('X(m)');
subplot(2,1,2);
plot(erle.time_plot,erle.Y_plot);xlabel('tiempo(s)');ylabel('Y(m)');
