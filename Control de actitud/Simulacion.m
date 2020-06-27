clear all;
close all;
clc;

global erle;
erle_variables;

erle.contador = 0;
erle.T_simulacion = 15;% segundos
erle.T_escalon_p = 2;%(segundios);
erle.T_escalon_q = 5;%(segundios);
erle.T_escalon_r = 7;%(segundios)
U1 = erle.g*erle.m;

for time = 0:erle.Tm:erle.T_simulacion
    %% Referencias
    % Señal de entrada p_des
    if(time < erle.T_escalon_p)
        erle.p_des = 0;
    end
    if(time >= erle.T_escalon_p)
        
        erle.p_des = 20*(erle.Deg_Rad);
    end
    % Señal de entrada q_des
        if(time < erle.T_escalon_q)
        erle.q_des = 0;
    end
    if(time >= erle.T_escalon_q)
        erle.p_des = 0;
        erle.q_des = 20*(erle.Deg_Rad);
    end
    % Señal de entrada r_des
        if(time < erle.T_escalon_r)
            erle.r_des = 0;
    end
    if(time >= erle.T_escalon_r)
%     erle.p_des = 0;
%     erle.q_des = 0;
    erle.r_des = 40*(erle.Deg_Rad);
    end
    
        if(time >= 10)
    erle.p_des = 0;
    erle.q_des = 0;
    erle.r_des = 0;
    end
    
      %% Variables estáticas
  erle.p_des_plot(erle.indice) = erle.p_des;
  erle.q_des_plot(erle.indice) = erle.q_des;
  erle.r_des_plot(erle.indice) = erle.r_des;
  erle.time_plot(erle.indice) = time;
   
    %%  Lazo de control
  U_des = rate_control([erle.p_des,erle.q_des,erle.r_des]);
  U_sat = saturacion_actuaciones([U1,U_des]);
  rate = ecuaciones_dinamicas(U_sat);
  
end
%% Gráficas
%Control de p
figure;
subplot(3,1,1);
plot(erle.time_plot,erle.p_des_plot,erle.time_plot,erle.p_plot);legend('p_ref','p_actual');xlabel('t(s)');ylabel('p(rad/s)');title('Velocidad angular en Xb');
subplot(3,1,2);
plot(erle.time_plot,erle.U2_plot);legend('U2');xlabel('t(s)');ylabel('U2(Kg*m/s^2)');title('Momento en Xb');
subplot(3,1,3);
plot(erle.time_plot,erle.roll_plot);legend('roll');xlabel('t(s)');ylabel('roll(Deg)');title('Ángulo de inclinación Roll');
%Control de q
figure;
subplot(3,1,1);
plot(erle.time_plot,erle.q_des_plot,erle.time_plot,erle.q_plot);legend('q_ref','q_actual');xlabel('t(s)');ylabel('q(rad/s)');title('Velocidad angular en Yb');
subplot(3,1,2);
plot(erle.time_plot,erle.U3_plot);legend('U3');xlabel('t(s)');ylabel('U3(Kg*m/s^2)');title('Momento en Yb');
subplot(3,1,3);
plot(erle.time_plot,erle.pitch_plot);legend('pitch');xlabel('t(s)');ylabel('pitch(Deg)');title('Ángulo de inclinación Pitch');
%Control de r
figure;
subplot(3,1,1);
plot(erle.time_plot,erle.r_des_plot,erle.time_plot,erle.r_plot);legend('r_ref','r_actual');xlabel('t(s)');ylabel('r(rad/s)');title('Velocidad angular en Zb');
subplot(3,1,2);
plot(erle.time_plot,erle.U4_plot);legend('U4');xlabel('t(s)');ylabel('U4(Kg*m/s^2)');title('Momento en Zb');
subplot(3,1,3);
plot(erle.time_plot,erle.yaw_plot);legend('yaw');xlabel('t(s)');ylabel('yaw(Deg)');title('Ángulo de inclinación Yaw');


