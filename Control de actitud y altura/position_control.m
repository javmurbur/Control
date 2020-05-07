function position_control

global erle;

[erle.X_des_asd,erle.Y_des_asd,erle.Z_des_asd] = rotateGFtoBF(erle.X_des,0,0,0,0,erle.yaw);
[erle.X_BF,erle.Y_BF,erle.Z_BF] = rotateGFtoBF(erle.X,erle.Y,erle.Z,erle.roll,erle.pitch,erle.yaw);
[erle.X_d_BF,erle.Y_d_BF,erle.Z_d_BF] = rotateGFtoBF(erle.X_d,erle.Y_d,erle.Z_d,erle.roll,erle.pitch,erle.yaw);

 %% Control de altitud
   erle.X_des_filt = (erle.X_TI_F/(erle.X_TI_F+erle.Tm))*erle.X_des_filt_1 + (erle.Tm/(erle.X_TI_F+erle.Tm))*erle.X_des_asd;
   % C�lculo del error
   X_ek = erle.X_des_filt - erle.X_BF;
   % Incremento de la integral del error
    erle.X_Int_ek = erle.X_Int_ek + erle.Tm*X_ek;
    % Controlador PI
    erle.pitch_des = ((erle.X_KP*(X_ek + (1/erle.X_TI)*erle.X_Int_ek + erle.X_TD*(erle.X_d_BF))));
    % Saturaci�n
    erle.pitch_des = -erle.pitch_des * erle.Deg_Rad;
    erle.pitch_des = min(erle.pitch_max,max(-erle.pitch_max,erle.pitch_des));
    
    erle.X_des_filt_1 = erle.X_des_filt;
    erle.X_ek_1 = X_ek;
    
%      %% Control de altitud
%    erle.Y_des_filt = (erle.Y_TI_F/(erle.Y_TI_F+erle.Tm))*erle.Y_des_filt_1 + (erle.Tm/(erle.Y_TI_F+erle.Tm))*erle.Y_des;
%    % C�lculo del error
%    Y_ek = erle.Y_des_filt - erle.Y;
%    % Incremento de la integral del error
%     erle.Y_Int_ek = erle.Y_Int_ek + erle.Tm*Y_ek;
%     % Controlador PI
%     erle.roll_des = ((erle.Y_KP*(Y_ek + (1/erle.Y_TI)*erle.Y_Int_ek + erle.Y_TD*((Y_ek-erle.Y_ek_1)/erle.Tm))));
%     % Saturaci�n
%     erle.roll_des = erle.roll_des*erle.Deg_Rad;
%     erle.roll_des = min(erle.roll_max,max(-erle.roll_max,erle.roll_des));
%     
%     erle.Y_des_filt_1 = erle.Y_des_filt;
%     erle.Y_ek_1 = X_ek;
    
end

