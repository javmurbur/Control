clear all;
close all;
clc;

global erle;
erle_variables;

erle.T_simulacion = 15;% segundos
erle.T_escalon = 2;
erle.Z_des = 1;

SimOut = sim('diagrama_de_bloques_actitud');

%Control de altura
figure;
subplot(4,1,1);
plot(tiempo,Z_GF_ref(:,1),tiempo,Z_GF(:,1),'LineWidth',2);legend('Z_{GF ref}','Z_{GF actual}');xlabel('t(s)');ylabel('altura (m)');title('Altura en ejes Globales');%axis([0 15 0 1]);
subplot(4,1,2);
plot(tiempo,erle.U1_plot,'LineWidth',2);legend('U1');xlabel('t(s)');ylabel('U1(Kg*m/s^2)');title('Fuerza de empuje en Zb');
subplot(4,1,3);
plot(tiempo,erle.Z_d_plot,'LineWidth',2);legend('Z_{dGF}');xlabel('t(s)');ylabel('velocidad(m/s)');title('Velocidad lineal en Z^G');
subplot(4,1,4);
plot(tiempo,erle.Z_dd_plot,'LineWidth',2);legend('Z_{ddGF}');xlabel('t(s)');ylabel('aceleración(m/s^2)');title('Aceleración lineal en Z^G');

