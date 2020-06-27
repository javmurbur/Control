clear all;
close all;
clc;

addpath Simulador

global erle;

init_plot;
plot_erle_model;
erle_variables;

erle.contador = 0;

erle.T_simulacion = 15;% segundos
erle.T_escalon_altura = 2;%(segundos);
erle.T_escalon_posicion = 4;%(segundos);
erle.T_escalon_yaw = 7;%(segundos)

erle.X_des = 0;
erle.Y_des = 0;

for time = 0:erle.Tm:erle.T_simulacion
    %% Referencias
    
    if(time >= erle.T_escalon_altura)
        
        erle.Z_des = 1;
    end
    if(time >= erle.T_escalon_posicion)
        erle.X_des = 0;
        erle.Y_des = 0;
        
    end
        if(time < erle.T_escalon_yaw)
        erle.yaw_des = 0;
    end
    if(time >= erle.T_escalon_yaw)
        erle.yaw_des = 0*erle.Deg_Rad;
    end
    
      %% Variables estáticas
  erle.X_des_plot(erle.indice) = erle.X_des;
  erle.Y_des_plot(erle.indice) = erle.Y_des;
  erle.Z_des_plot(erle.indice) = erle.Z_des;
  erle.yaw_des_plot(erle.indice) = erle.yaw_des*erle.Rad_Deg;
  erle.time_plot(erle.indice) = time;
  [erle.X_dd_BF,erle.Y_dd_BF,erle.Z_dd_BF_plot(erle.indice)] = rotateGFtoBF(erle.X_dd,erle.Y_dd,erle.Z_dd,erle.roll,erle.pitch,erle.yaw);
    
    %%  Lazo de control
  Actitud = position_control([erle.X_des,erle.Y_des]);
  
  Actitud_corr = yaw_correccion(Actitud);
  
  rate_des = attitude_control([erle.Z_des,Actitud_corr,erle.yaw_des]);
  
  U_des = rate_control([rate_des(2),rate_des(3),rate_des(4)]);
  
  U_sat = saturacion_actuaciones([rate_des(1),U_des]);
  
  out = ecuaciones_dinamicas(U_sat);
  
  if(erle.contador == 3)
  plot_erle;
  drawnow
    erle.contador = 0;
  end
  
    erle.contador = erle.contador + 1;
  

  
end
%% Gráficas
%Control de altura
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.Z_GF_plot,erle.time_plot,erle.Z_des_plot);xlabel('tiempo(s)');ylabel('Z(m)');
subplot(2,1,2);
plot(erle.time_plot,erle.U1_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.Z_d_GF_plot);title('Zd(m/s)');
figure;
plot(erle.time_plot,erle.Z_dd_GF_plot);title('Zdd(m/s^2)');
%Control del roll
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.roll_plot,erle.time_plot,erle.roll_des_plot);xlabel('tiempo(s)');ylabel('roll(Deg)');legend('actual','deseado');
subplot(2,1,2);
plot(erle.time_plot,erle.U2_plot);legend('Señal de control(U2)');
figure;
plot(erle.time_plot,erle.p_plot);title('p(Deg/s)');
%Control del pitch
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.pitch_plot,erle.time_plot,erle.pitch_des_plot);xlabel('tiempo(s)');ylabel('pitch(deg)');legend('actual','deseado');
subplot(2,1,2);
plot(erle.time_plot,erle.U3_plot);legend('Señal de control(U3)');
figure;
plot(erle.time_plot,erle.q_plot);title('q(Deg/s)');
%Control del yaw
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.yaw_plot,erle.time_plot,erle.yaw_des_plot);xlabel('tiempo(s)');ylabel('yaw(deg)');legend('actual','deseado');
subplot(2,1,2);
plot(erle.time_plot,erle.U4_plot);legend('Señal de control(U4)');
figure;
plot(erle.time_plot,erle.r_plot);title('r(Deg/s)');
% Posiciones
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.X_GF_plot,erle.time_plot,erle.X_des_plot);xlabel('tiempo(s)');ylabel('X(m)');legend('actual','deseada');
subplot(2,1,2);
plot(erle.time_plot,erle.Y_GF_plot,erle.time_plot,erle.Y_des_plot);xlabel('tiempo(s)');ylabel('Y(m)');legend('actual','deseada');
