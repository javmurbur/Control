clear all;
close all;
clc;

global erle;
erle_variables;

for time = 0:erle.Tm:erle.T_simulacion
    % Señal de entrada
    if(time < erle.T_escalon)
        erle.roll_des = 0;
    end
    if(time >= erle.T_escalon)
        erle.roll_des = 15*erle.Deg_Rad;
    end
    
  attitude_control;
  rate_control;
  ecuaciones_dinamicas;
  
  erle.roll_des_plot(erle.indice) = erle.roll_des*erle.Rad_Deg;
  erle.time_plot(erle.indice) = time;
  erle.indice = erle.indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.roll_plot,erle.time_plot,erle.roll_des_plot);xlabel('tiempo(s)');ylabel('p(rad/s)');
subplot(2,1,2);
plot(erle.time_plot,erle.U2_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.p_plot);title('p(rad/s)');