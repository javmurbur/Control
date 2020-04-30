function attitude_control

    global erle;
    
   %% Control del pitch
   erle.pitch_des_filt = (erle.pitch_TI_F/(erle.pitch_TI_F+erle.Tm))*erle.pitch_des_filt_1 + (erle.Tm/(erle.pitch_TI_F+erle.Tm))*erle.pitch_des;
   % Cálculo del error
   pitch_ek = erle.pitch_des_filt - erle.pitch;
   % Incremento de la integral del error
    erle.pitch_Int_ek = erle.pitch_Int_ek + erle.Tm*pitch_ek;
   % Controlador PI
    erle.q_des = erle.pitch_KP*(pitch_ek + (1/erle.pitch_TI)*erle.pitch_Int_ek + erle.pitch_TD*((pitch_ek-erle.pitch_ek_1)/erle.Tm));
    % Saturación
    erle.q_des = min(erle.q_max,max(-erle.q_max,erle.q_des));
    
    erle.pitch_des_filt_1 = erle.pitch_des_filt;
    erle.pitch_ek_1 = pitch_ek;
    
   
end