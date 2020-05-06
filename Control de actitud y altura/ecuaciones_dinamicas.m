function ecuaciones_dinamicas

global erle;

    erle.X_dd = (-(cos(erle.roll)*cos(erle.yaw)*sin(erle.pitch) + sin(erle.roll)*sin(erle.yaw))*erle.U1 - 0.15*erle.X_d)/erle.m; 
    erle.Y_dd = (-(cos(erle.roll)*sin(erle.yaw)*sin(erle.pitch) - sin(erle.roll)*cos(erle.yaw))*erle.U1 - 0.15*erle.Y_d)/erle.m;
    erle.Z_dd = (-(cos(erle.roll)*cos(erle.pitch))*erle.U1 - 0.3*erle.Z_d)/erle.m + erle.g;

erle.p_d = ((erle.Iyy - erle.Izz)*erle.q*erle.r - erle.Jr*erle.q*(erle.w0+erle.w1-erle.w2-erle.w3) + erle.U2)/erle.Ixx;
erle.q_d = ((erle.Izz - erle.Ixx)*erle.p*erle.r + erle.Jr*erle.p*(erle.w0+erle.w1-+erle.w2-erle.w3) + erle.U3)/erle.Iyy;
erle.r_d = ((erle.Ixx - erle.Iyy)*erle.p*erle.q + erle.U4)/erle.Izz;
%      Cálculo de p,q y r
    erle.p = erle.p_d * erle.Tm + erle.p;
    erle.q = erle.q_d * erle.Tm + erle.q;
    erle.r = erle.r_d * erle.Tm + erle.r;

%     roll_d = erle.p + sin(erle.roll)*tan(erle.pitch)*erle.q + cos(erle.roll)*tan(erle.pitch)*erle.r;
%     pitch_d = cos(erle.roll)*erle.q - sin(erle.roll)*erle.r;
%     yaw_d = sin(erle.roll)/cos(erle.pitch) * erle.q + cos(erle.roll)/cos(erle.pitch) * erle.r;
%     
%

% % Velocidad y posición en Z
erle.Z_d = erle.Z_dd * erle.Tm + erle.Z_d;
erle.Z = erle.Z_d * erle.Tm + erle.Z;
% 
% % Velocidad y posición en Y
erle.Y_d = erle.Y_dd * erle.Tm + erle.Y_d;
erle.Y = erle.Y_d * erle.Tm + erle.Y;
% 
% % Velocidad y posición en X
erle.X_d = erle.X_dd * erle.Tm + erle.X_d;
erle.X = erle.X_d * erle.Tm + erle.X;

% Cálculo de los ángulos
erle.roll = erle.p *erle.Tm + erle.roll;
erle.pitch = erle.q * erle.Tm + erle.pitch;
erle.yaw = erle.r * erle.Tm + erle.yaw;

    %% Variables para graficar
    erle.roll_plot(erle.indice) = erle.roll*erle.Rad_Deg;
    erle.p_plot(erle.indice) = erle.p;
    erle.U2_plot(erle.indice) = erle.U2;
    
    erle.pitch_plot(erle.indice) = erle.pitch*erle.Rad_Deg;
    erle.q_plot(erle.indice) = erle.q;
    erle.U3_plot(erle.indice) = erle.U3;
    
    erle.yaw_plot(erle.indice) = erle.yaw*erle.Rad_Deg;
    erle.r_plot(erle.indice) = erle.r;
    erle.U4_plot(erle.indice) = erle.U4;
    
   erle.Z_plot(erle.indice) = erle.Z;
   erle.U1_plot(erle.indice) = erle.U1;
   erle.Z_d_plot(erle.indice) = erle.Z_d;
   erle.Z_dd_plot(erle.indice) = erle.Z_dd;
   
   erle.X_plot(erle.indice) = erle.X;
   erle.Y_plot(erle.indice) = erle.Y;

end