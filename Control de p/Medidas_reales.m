
clear all;
close all;
clc;

m_74;

%Constante para pasar de Centi-grados a radianes
DegToRad = pi/180/100;

figure;
plot(RATE.data(:,1),RATE.data(:,4)*DegToRad);
% figure;
% plot(RATE.data(:,1),RATE.data(:,6)*DegToRad);
% figure;
% plot(RATE.data(:,1),RATE.data(:,8)*DegToRad);

%% Diseño del control

% G = tf([1],[0.034756 0]);
% rltool(G);