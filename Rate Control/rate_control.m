function out = rate_control (in)

p_des = in(1);
q_des = in(2);
r_des = in(3);

global erle;

%% Control de variación del roll

    erle.p_des_filt = (erle.p_F_TI/(erle.p_F_TI+erle.Tm))*erle.p_des_filt_1 + (erle.Tm/(erle.p_F_TI+erle.Tm))*p_des;
    p_ek = erle.p_des_filt - erle.p;
   % Incremento de la integral del error
    erle.p_Int_ek = erle.p_Int_ek + erle.Tm*p_ek;
   % Controlador PI
    U2 = erle.p_KP*(p_ek + (1/erle.p_TI)*erle.p_Int_ek + erle.p_TD*((p_ek-erle.p_ek_1)/erle.Tm));
    % Saturación
    U2 = min(erle.U2_max,max(erle.U2_min,U2));
    erle.p_ek_1 = p_ek;
    erle.p_des_filt_1 = erle.p_des_filt;

%% Control de variación del roll
erle.q_des_filt = (erle.q_F_TI/(erle.q_F_TI+erle.Tm))*erle.q_des_filt_1 + (erle.Tm/(erle.q_F_TI+erle.Tm))*q_des;
    q_ek = erle.q_des_filt - erle.q;
   % Incremento de la integral del error
    erle.q_Int_ek = erle.q_Int_ek + erle.Tm*q_ek;
   % Controlador PI
    U3 = erle.q_KP*(q_ek + (1/erle.q_TI)*erle.q_Int_ek + erle.q_TD*((q_ek-erle.q_ek_1)/erle.Tm));
    % Saturación
    U3 = min(erle.U3_max,max(erle.U3_min,U3));
    erle.q_ek_1 =q_ek;
    erle.q_des_filt_1 = erle.q_des_filt;
    
%% Control de variación del roll
erle.r_des_filt = (erle.r_F_TI/(erle.r_F_TI+erle.Tm))*erle.r_des_filt_1 + (erle.Tm/(erle.r_F_TI+erle.Tm))*r_des;
    r_ek = erle.r_des_filt - erle.r;
   % Incremento de la integral del error
    erle.r_Int_ek = erle.r_Int_ek + erle.Tm*r_ek;
   % Controlador PI
    U4 = erle.r_KP*(r_ek + (1/erle.r_TI)*erle.r_Int_ek + erle.r_TD*((r_ek-erle.r_ek_1)/erle.Tm));
    % Saturación
    U4 = min(erle.U4_max,max(erle.U4_min,U4));
    erle.r_ek_1 = r_ek;
    erle.r_des_filt_1 = erle.r_des_filt;
    
    out = [U2,U3,U4];

end