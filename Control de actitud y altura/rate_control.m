function rate_control

global erle;

%% Control de variación del roll
    p_ek = erle.p_des - erle.p;
   % Incremento de la integral del error
    erle.p_Int_ek = erle.p_Int_ek + erle.Tm*p_ek;
   % Controlador PI
    erle.U2 = erle.p_KP*(p_ek + (1/erle.p_TI)*erle.p_Int_ek + erle.p_TD*((p_ek-erle.p_ek_1)/erle.Tm));
    % Saturación
    erle.U2 = min(erle.U2_max,max(erle.U2_min,erle.U2));
    erle.p_ek_1 = p_ek;

%% Control de variación del roll
    q_ek = erle.q_des - erle.q;
   % Incremento de la integral del error
    erle.q_Int_ek = erle.q_Int_ek + erle.Tm*q_ek;
   % Controlador PI
    erle.U3 = erle.q_KP*(q_ek + (1/erle.q_TI)*erle.q_Int_ek + erle.q_TD*((q_ek-erle.q_ek_1)/erle.Tm));
    % Saturación
    erle.U3 = min(erle.U3_max,max(erle.U3_min,erle.U3));
    erle.q_ek_1 =q_ek;
    
%% Control de variación del roll
    r_ek = erle.r_des - erle.r;
   % Incremento de la integral del error
    erle.r_Int_ek = erle.r_Int_ek + erle.Tm*r_ek;
   % Controlador PI
    erle.U4 = erle.r_KP*(r_ek + (1/erle.r_TI)*erle.r_Int_ek + erle.r_TD*((r_ek-erle.r_ek_1)/erle.Tm));
    % Saturación
    erle.U4 = min(erle.U4_max,max(erle.U4_min,erle.U4));
    erle.r_ek_1 = r_ek;

end