function rate_control

global erle;

%% Control de variación del roll
    p_ek = erle.p_des - erle.p;
   % Incremento de la integral del error
    erle.p_Int_ek = erle.p_Int_ek + erle.Tm*p_ek;
   % Controlador PI
    erle.U2 = erle.p_KP*(p_ek + (1/erle.p_TI)*erle.p_Int_ek + erle.p_TD*erle.p_d);
    % Saturación
    erle.p_ek_1 = p_ek;
    erle.U2 = min(erle.U2_max,max(erle.U2_min,erle.U2));

end