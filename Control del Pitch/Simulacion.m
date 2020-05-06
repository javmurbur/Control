clear all;
close all;
clc;

global erle;
erle_variables;

for time = 0:erle.Tm:erle.T_simulacion
    % Señal de entrada
    if(time < erle.T_escalon)
        erle.pitch_des = 0;
    end
    if(time >= erle.T_escalon)
        erle.pitch_des = 10;
    end
    
  attitude_control;
  rate_control;
  ecuaciones_dinamicas;
  
  erle.pitch_des_plot(erle.indice) = erle.pitch_des;
  erle.time_plot(erle.indice) = time;
  erle.indice = erle.indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.pitch_plot,erle.time_plot,erle.pitch_des_plot);xlabel('tiempo(s)');ylabel('p(rad/s)');
subplot(2,1,2);
plot(erle.time_plot,erle.U3_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.q_plot);title('p(Deg/s)');