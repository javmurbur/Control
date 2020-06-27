Izz = 0.0977;   % (Kg*m^2)
G = tf([1],[Izz 0]);
% rltool(G);

%% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 39.08 * (1+0.1*s)/s
% tiempo de subida = 0.195 (segundos)

[TI,TD,KP,KI,KD] = calculo_PID(39.08,0.1,0);
F = tf([1],[0.1 1]);
% 
% %% Discretización
% Tm = 0.01;
% Gz = c2d(G,Tm);
% Fz = c2d(F,Tm);
% 
%% Simulación
% Parámetros de la simulación
    T_simulacion = 5;%(segundos)
    T_escalon = 2;%(segundios)
% Variables
    ek = 0;% error
    ek_1 = 0;% error anterior
    yk = 0;% salida
    uk_1 = 0;% referencia anterior
    yk_d = 0;% derivada de la salida
    Int_ek = 0;% integral del error
    yaw = 0;
% Variables para graficar
    time_plot = [0:Tm:T_simulacion];
    uk_plot = [0:Tm:T_simulacion];
    Uk_plot = [0:Tm:T_simulacion];
    yk_plot = [0:Tm:T_simulacion];
    yaw_plot = [0:Tm:T_simulacion];

%Bucle se simulación
    indice = 1;
for time = 0:Tm:T_simulacion
    % Señal de entrada
    if(time < T_escalon)
        uk = 0;
    end
    if(time >= T_escalon)
        uk = 1;
    end
   % Filtrado de la entrada
    uk_filtrada = (TI/(TI+Tm))*uk_1 + (Tm/(TI+Tm))*uk;
   % Cálculo del error
    ek = uk_filtrada - yk;
   % Incremento de la integral del error
    Int_ek = Int_ek + Tm*ek;
   % Controlador PI
    Uk = KP*(ek + (1/TI)*Int_ek + TD*((ek-ek_1)/Tm));
   % Salida del sistema
    yk_d = Uk/Izz;
    yk = yk_d*Tm + yk;
    yaw = yk*Tm + yaw;
   % Actualizar variables estáticas
    ek_1 = ek;
    uk_1 = uk_filtrada;
   % Almacenar valores para graficar
    uk_plot(indice) = uk;
    yk_plot(indice) = yk;
    Uk_plot(indice) = Uk;
    time_plot(indice) = time;
    yaw_plot(indice) = yaw*(180/pi);
    indice = indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(time_plot,yk_plot,time_plot,uk_plot);xlabel('tiempo(s)');ylabel('r(rad/s)');legend('referencia','salida');axis([0 5 0 1.5])
subplot(2,1,2);
plot(time_plot,Uk_plot);legend('Señal de control');ylabel('U4(Kg*m/s^2)');
figure;
plot(time_plot,yaw_plot);title('Yaw(Deg)');