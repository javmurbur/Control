function out = ecuaciones_dinamicas(in)

U1 = in(1);
U2 = in(2);
U3 = in(3);
U4 = in(4);

global erle;

    erle.X_dd_GF = (+(cos(erle.roll)*cos(erle.yaw)*sin(erle.pitch) + sin(erle.roll)*sin(erle.yaw))*U1 - 0.15*erle.X_d_GF)/erle.m; 
    erle.Y_dd_GF = (+(cos(erle.roll)*sin(erle.yaw)*sin(erle.pitch) - sin(erle.roll)*cos(erle.yaw))*U1 - 0.15*erle.Y_d_GF)/erle.m;
    erle.Z_dd_GF = (+(cos(erle.roll)*cos(erle.pitch))*U1 - 0.3*erle.Z_d_GF)/erle.m - erle.g;

    erle.p_d = ((erle.Iyy - erle.Izz)*erle.q*erle.r - erle.Jr*erle.q*(-erle.w0-erle.w1+erle.w2+erle.w3) + U2)/erle.Ixx;
    erle.q_d = ((erle.Izz - erle.Ixx)*erle.p*erle.r + erle.Jr*erle.p*(-erle.w0-erle.w1+erle.w2+erle.w3) + U3)/erle.Iyy;
    erle.r_d = ((erle.Ixx - erle.Iyy)*erle.p*erle.q + U4)/erle.Izz;
%      Cálculo de p,q y r
    erle.p = erle.p_d * erle.Tm + erle.p;
    erle.q = erle.q_d * erle.Tm + erle.q;
    erle.r = erle.r_d * erle.Tm + erle.r;

    roll_d = erle.p + sin(erle.roll)*tan(erle.pitch)*erle.q + cos(erle.roll)*tan(erle.pitch)*erle.r;
    pitch_d = cos(erle.roll)*erle.q - sin(erle.roll)*erle.r;
    yaw_d = sin(erle.roll)/cos(erle.pitch) * erle.q + cos(erle.roll)/cos(erle.pitch) * erle.r;
%     
%

% % Velocidad y posición en Z
erle.Z_d_GF = erle.Z_dd_GF * erle.Tm + erle.Z_d_GF;
erle.Z_GF = erle.Z_d_GF * erle.Tm + erle.Z_GF;
% 
% % Velocidad y posición en Y
erle.Y_d_GF = erle.Y_dd_GF * erle.Tm + erle.Y_d_GF;
erle.Y_GF = erle.Y_d_GF * erle.Tm + erle.Y_GF;
% 
% % Velocidad y posición en X
erle.X_d_GF = erle.X_dd_GF * erle.Tm + erle.X_d_GF;
erle.X_GF = erle.X_d_GF * erle.Tm + erle.X_GF;

% Cálculo de los ángulos
erle.roll = roll_d *erle.Tm + erle.roll;
erle.pitch = pitch_d * erle.Tm + erle.pitch;
erle.yaw = yaw_d * erle.Tm + erle.yaw;

if( erle.indice <= size(erle.time_plot,2))
    %% Variables para graficar
    erle.roll_plot(erle.indice) = erle.roll*erle.Rad_Deg;
    erle.p_plot(erle.indice) = erle.p;
    erle.U2_plot(erle.indice) = U2;
    
    erle.pitch_plot(erle.indice) = erle.pitch*erle.Rad_Deg;
    erle.q_plot(erle.indice) = erle.q;
    erle.U3_plot(erle.indice) = U3;
    
    erle.yaw_plot(erle.indice) = erle.yaw*erle.Rad_Deg;
    erle.r_plot(erle.indice) = erle.r;
    erle.U4_plot(erle.indice) = U4;
    
   erle.Z_GF_plot(erle.indice) = erle.Z_GF;
   erle.U1_plot(erle.indice) = U1;
   erle.Z_d_GF_plot(erle.indice) = erle.Z_d_GF;
   erle.Z_dd_GF_plot(erle.indice) = erle.Z_dd_GF;
   
   erle.X_GF_plot(erle.indice) = erle.X_GF;
   erle.Y_GF_plot(erle.indice) = erle.Y_GF;
   
   erle.indice = erle.indice + 1;
end
    
   out = [erle.X_GF,erle.Y_GF,erle.Z_GF,erle.roll*erle.Rad_Deg,erle.pitch*erle.Rad_Deg,erle.yaw*erle.Rad_Deg];

end