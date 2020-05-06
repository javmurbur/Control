function rate_control

global erle;

%% Control de variación de r
    r_ek = erle.r_des - erle.r;
   % Incremento de la integral del error
    erle.r_Int_ek = erle.r_Int_ek + erle.Tm*r_ek;
   % Controlador PI
    erle.U4 = erle.r_KP*(r_ek + (1/erle.r_TI)*erle.r_Int_ek + erle.r_TD*erle.r_d);
    % Saturación
    erle.U4 = min(erle.U4_max,max(erle.U4_min,erle.U4));

end