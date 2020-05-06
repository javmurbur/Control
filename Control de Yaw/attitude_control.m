function attitude_control

    global erle;
    
   %% Control del yaw
   erle.yaw_des_filt = (erle.yaw_TI_F/(erle.yaw_TI_F+erle.Tm))*erle.yaw_des_filt_1 + (erle.Tm/(erle.yaw_TI_F+erle.Tm))*erle.yaw_des;
   % Cálculo del error
   yaw_ek = erle.yaw_des_filt - erle.yaw;
   % Incremento de la integral del error
    erle.yaw_Int_ek = erle.yaw_Int_ek + erle.Tm*yaw_ek;
   % Controlador PI
    erle.r_des = erle.yaw_KP*(yaw_ek + (1/erle.yaw_TI)*erle.yaw_Int_ek + erle.yaw_TD*((yaw_ek-erle.yaw_ek_1)/erle.Tm));
    % Saturación
    erle.r_des = min(erle.r_max,max(-erle.r_max,erle.r_des));
    
    erle.yaw_des_filt_1 = erle.yaw_des_filt;
    erle.yaw_ek_1 = yaw_ek;
    
   
end