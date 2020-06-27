clear all;
close all;
clc;

addpath Simulador

global erle;
erle_variables;

erle.T_simulacion = 15;% segundos
erle.T_escalon_yaw = 7;%(segundos)
erle.T_escalon_p = 2;%(segundos);
erle.T_escalon_q = 5;%(segundos);
erle.T_escalon_r = 7;%(segundos)

erle.p_des = 20*(erle.Deg_Rad);
erle.q_des = 0*(erle.Deg_Rad);
erle.r_des = 0*(erle.Deg_Rad);

SimOut = sim('diagrama_de_bloques');

%Control de p
figure;
subplot(3,1,1);
plot(tiempo,rate_des(:,1),tiempo,erle.p_plot);legend('p_ref','p_actual');xlabel('t(s)');ylabel('p(rad/s)');title('Velocidad angular en Xb');
subplot(3,1,2);
plot(tiempo,erle.U2_plot);legend('U2');xlabel('t(s)');ylabel('U2(Kg*m/s^2)');title('Momento en Xb');
subplot(3,1,3);
plot(tiempo,erle.roll_plot);legend('roll');xlabel('t(s)');ylabel('roll(Deg)');title('Ángulo de inclinación Roll');
%Control de q
figure;
subplot(3,1,1);
plot(tiempo,rate_des(:,2),tiempo,erle.q_plot);legend('q_ref','q_actual');xlabel('t(s)');ylabel('q(rad/s)');title('Velocidad angular en Yb');
subplot(3,1,2);
plot(tiempo,erle.U3_plot);legend('U3');xlabel('t(s)');ylabel('U3(Kg*m/s^2)');title('Momento en Yb');
subplot(3,1,3);
plot(tiempo,erle.pitch_plot);legend('pitch');xlabel('t(s)');ylabel('pitch(Deg)');title('Ángulo de inclinación Pitch');
%Control de r
figure;
subplot(3,1,1);
plot(tiempo,rate_des(:,3),tiempo,erle.r_plot);legend('r_ref','r_actual');xlabel('t(s)');ylabel('r(rad/s)');title('Velocidad angular en Zb');
subplot(3,1,2);
plot(tiempo,erle.U4_plot);legend('U4');xlabel('t(s)');ylabel('U4(Kg*m/s^2)');title('Momento en Zb');
subplot(3,1,3);
plot(tiempo,erle.yaw_plot);legend('yaw');xlabel('t(s)');ylabel('yaw(Deg)');title('Ángulo de inclinación Yaw');


