clear all;
close all;
clc;

global erle;
erle_variables;

for time = 0:erle.Tm:erle.T_simulacion
    % Señal de entrada
    if(time < erle.T_escalon)
        erle.Z_des = 0;
    end
    if(time >= erle.T_escalon)
        erle.Z_des = 1;
    end
    
  altitud_control;
  ecuaciones_dinamicas;
  
  erle.Z_des_plot(erle.indice) = erle.Z_des;
  erle.time_plot(erle.indice) = time;
  erle.indice = erle.indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(erle.time_plot,erle.Z_plot,erle.time_plot,erle.Z_des_plot);xlabel('tiempo(s)');ylabel('Z(m)');
subplot(2,1,2);
plot(erle.time_plot,erle.U1_plot);legend('Señal de control');
figure;
plot(erle.time_plot,erle.Z_d_plot);title('Zd(m/s)');
figure;
plot(erle.time_plot,erle.Z_dd_plot);title('Zdd(m/s^2)');