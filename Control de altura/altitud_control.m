function altitud_control

    global erle;
    
   %% Control del Z
   erle.Z_des_filt = (erle.Z_TI_F/(erle.Z_TI_F+erle.Tm))*erle.Z_des_filt_1 + (erle.Tm/(erle.Z_TI_F+erle.Tm))*erle.Z_des;
   % Cálculo del error
   Z_ek = erle.Z_des_filt - erle.Z;
   % Incremento de la integral del error
    erle.Z_Int_ek = erle.Z_Int_ek + erle.Tm*Z_ek;
    % Controlador PI
    erle.U1 = (erle.Z_KP*(Z_ek + (1/erle.Z_TI)*erle.Z_Int_ek + erle.Z_TD*((Z_ek-erle.Z_ek_1)/erle.Tm))) + erle.m*erle.g;
    % Saturación
    erle.U1 = min(erle.U1_max,max(erle.U1_min,erle.U1));
    
    erle.Z_des_filt_1 = erle.Z_des_filt;
    erle.Z_ek_1 = Z_ek;
    
   
end