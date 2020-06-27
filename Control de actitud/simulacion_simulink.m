clear all;
close all;
clc;

addpath Simulador

global erle;
erle_variables;

erle.T_simulacion = 15;% segundos
erle.T_escalon_roll = 2;%(segundos);
erle.T_escalon_pitch = 5;%(segundos);
erle.T_escalon_yaw = 10;%(segundos)

erle.roll_des = 15;
erle.pitch_des = 10;
erle.yaw_des = 45;

SimOut = sim('diagrama_de_bloques_actitud');

%Control de roll
figure;
subplot(3,1,1);
plot(tiempo,actitud_des(:,1),tiempo,erle.roll_plot);legend('roll_ref','roll_actual');xlabel('t(s)');ylabel('roll(º)');title('Ángulo de inclinación Roll en grados');axis([0 15 0 30]);
subplot(3,1,2);
plot(tiempo,erle.U2_plot);legend('U2');xlabel('t(s)');ylabel('U2(Kg*m/s^2)');title('Momento en Xb');
subplot(3,1,3);
plot(tiempo,erle.p_plot);legend('p');xlabel('t(s)');ylabel('p(º/s)');title('Velocidad angular en Xb');
%Control de pitch
figure;
subplot(3,1,1);
plot(tiempo,actitud_des(:,2),tiempo,erle.pitch_plot);legend('pitch_ref','pitch_actual');xlabel('t(s)');ylabel('pitch(º)');title('Ángulo de inclinación Pitch en grados');axis([0 15 0 30]);
subplot(3,1,2);
plot(tiempo,erle.U3_plot);legend('U3');xlabel('t(s)');ylabel('U3(Kg*m/s^2)');title('Momento en Yb');
subplot(3,1,3);
plot(tiempo,erle.q_plot);legend('q');xlabel('t(s)');ylabel('q(º/s)');title('Velocidad angular en Yb');
%Control de yaw
figure;
subplot(3,1,1);
plot(tiempo,actitud_des(:,3),tiempo,erle.yaw_plot);legend('yaw\_ref','yaw\_actual');xlabel('t(s)');ylabel('yaw(º)');title('Ángulo de inclinación Yaw en grados');axis([0 15 0 60]);
subplot(3,1,2);
plot(tiempo,erle.U4_plot);legend('U4');xlabel('t(s)');ylabel('U4(Kg*m/s^2)');title('Momento en Zb');
subplot(3,1,3);
plot(tiempo,erle.r_plot);legend('r');xlabel('t(s)');ylabel('r(º/s)');title('Velocidad angular en Zb');

