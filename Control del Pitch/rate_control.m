function rate_control

global erle;

%% Control de variación del roll
    q_ek = erle.q_des - erle.q;
   % Incremento de la integral del error
    erle.q_Int_ek = erle.q_Int_ek + erle.Tm*q_ek;
   % Controlador PI
    erle.U3 = erle.q_KP*(q_ek + (1/erle.q_TI)*erle.q_Int_ek + erle.q_TD*erle.q_d);
    % Saturación
    erle.U3 = min(erle.U3_max,max(erle.U3_min,erle.U3));

end