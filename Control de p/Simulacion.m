Ixx = 0.0347563;% (Kg*m^2)
G = tf([1],[Ixx 0]);
% rltool(G);

%% Controlador PI
%-> Zero real en s = -10
%-> Integrador s = 0
% C = 13.093 * (1+0.1*s)/s

[TI,TD,KP,KI,KD] = calculo_PID(13.093,0.1,0);
F = tf([1],[0.1 1]);

%% Discretización
Tm = 0.01;
Gz = c2d(G,Tm);
Fz = c2d(F,Tm);

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
    roll = 0;
    l = 0.141;
    Kt = 8.5486e-6;
    w_max = 838; % (rad/s)
    U_max = sqrt(2)*l*Kt*(w_max)^2;
% Variables para graficar
    time_plot = [0:Tm:T_simulacion];
    uk_plot = [0:Tm:T_simulacion];
    Uk_plot = [0:Tm:T_simulacion];
    yk_plot = [0:Tm:T_simulacion];
    roll_plot = [0:Tm:T_simulacion];

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
    Uk = min(U_max,max(-U_max,Uk));
   % Salida del sistema
    yk_d = Uk/Ixx;
    yk = yk_d*Tm + yk;
    roll = yk*Tm + roll;
   % Actualizar variables estáticas
    ek_1 = ek;
    uk_1 = uk_filtrada;
   % Almacenar valores para graficar
    uk_plot(indice) = uk;
    yk_plot(indice) = yk;
    Uk_plot(indice) = Uk;
    time_plot(indice) = time;
    roll_plot(indice) = roll;
    indice = indice + 1;
    
end
%% Gráficas
figure;
subplot(2,1,1);
plot(time_plot,yk_plot,time_plot,uk_plot);xlabel('t(s)');ylabel('p(rad/s)');legend('referencia','salida');
subplot(2,1,2);
plot(time_plot,Uk_plot);legend('Señal de control');xlabel('t(s)');ylabel('U2(Kg*m/s^2)');
figure;
plot(time_plot,roll_plot);title('Roll(Deg)');