function out = ecuaciones_dinamicas (in)

U1 = in(1);
U2 = in(2);
U3 = in(3);
U4 = in(4);

global erle;

erle.p_d = ((erle.Iyy - erle.Izz)*erle.q*erle.r - erle.Jr*erle.q*(-erle.w0-erle.w1+erle.w2+erle.w3) + U2)/erle.Ixx;
erle.q_d = ((erle.Izz - erle.Ixx)*erle.p*erle.r + erle.Jr*erle.p*(-erle.w0-erle.w1+erle.w2+erle.w3) + U3)/erle.Iyy;
erle.r_d = ((erle.Ixx - erle.Iyy)*erle.p*erle.q + U4)/erle.Izz;
%      C�lculo de p,q y r
    erle.p = erle.p_d * erle.Tm + erle.p;
    erle.q = erle.q_d * erle.Tm + erle.q;
    erle.r = erle.r_d * erle.Tm + erle.r;

    roll_d = erle.p + sin(erle.roll)*tan(erle.pitch)*erle.q + cos(erle.roll)*tan(erle.pitch)*erle.r;
    pitch_d = cos(erle.roll)*erle.q - sin(erle.roll)*erle.r;
    yaw_d = sin(erle.roll)/cos(erle.pitch) * erle.q + cos(erle.roll)/cos(erle.pitch) * erle.r;

% C�lculo de los �ngulos
erle.roll = roll_d *erle.Tm + erle.roll;
erle.pitch = pitch_d * erle.Tm + erle.pitch;
erle.yaw = yaw_d * erle.Tm + erle.yaw;

    %% Variables para graficar
    erle.roll_plot(erle.indice) = erle.roll*erle.Rad_Deg;
    erle.p_plot(erle.indice) = erle.p*erle.Rad_Deg;
    erle.U2_plot(erle.indice) = U2;
    
    erle.pitch_plot(erle.indice) = erle.pitch*erle.Rad_Deg;
    erle.q_plot(erle.indice) = erle.q*erle.Rad_Deg;
    erle.U3_plot(erle.indice) = U3;
    
    erle.yaw_plot(erle.indice) = erle.yaw*erle.Rad_Deg;
    erle.r_plot(erle.indice) = erle.r*erle.Rad_Deg;
    erle.U4_plot(erle.indice) = U4;
    
   erle.U1_plot(erle.indice) = U1;
   
   erle.indice = erle.indice + 1;
   
   roll = erle.roll*erle.Rad_Deg;
   pitch = erle.pitch*erle.Rad_Deg;
   yaw = erle.yaw*erle.Rad_Deg;
   
   out = [roll,pitch,yaw];

end