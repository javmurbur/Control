clear all;
close all;
clc;

global erle;
erle_variables;

for time = 0:erle.Tm:erle.T_simulacion
    % Señal de entrada
    if(time < erle.T_escalon)
        erle.yaw_des = 0;
    end
    if(time >= erle.T_escalon)
        erle.yaw_des = 10;
    end
    
  attitude_control;
  rate_control;
  ecuaciones_dinamicas;
  
  erle.yaw_des_plot(erle.indice) = erle.yaw_des;
  erle.time_plot(erle.indice) = time;
  erle.indice = erle.indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.yaw_plot,erle.time_plot,erle.yaw_des_plot);xlabel('tiempo(s)');ylabel('ryaw(º)');
subplot(2,1,2);
plot(erle.time_plot,erle.U4_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.r_plot);title('r(Deg/s)');