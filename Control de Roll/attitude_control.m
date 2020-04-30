function attitude_control

    global erle;
    
   %% Control del roll
   erle.roll_des_filt = (erle.roll_TI_F/(erle.roll_TI_F+erle.Tm))*erle.roll_des_filt_1 + (erle.Tm/(erle.roll_TI_F+erle.Tm))*erle.roll_des;
   % Cálculo del error
   roll_ek = erle.roll_des_filt - erle.roll;
   % Incremento de la integral del error
    erle.roll_Int_ek = erle.roll_Int_ek + erle.Tm*roll_ek;
    % Controlador PI
    erle.p_des = erle.roll_KP*(roll_ek + (1/erle.roll_TI)*erle.roll_Int_ek + erle.roll_TD*((roll_ek-erle.roll_ek_1)/erle.Tm));
    % Saturación
    erle.p_des = min(erle.p_max,max(-erle.p_max,erle.p_des));
    
    erle.roll_des_filt_1 = erle.roll_des_filt;
    erle.roll_ek_1 = roll_ek;
    
   
end