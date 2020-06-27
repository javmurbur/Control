function out = attitude_control(in)

    global erle;
    
    Z_des = in(1);
    roll_des = in(2);
    pitch_des = in(3);
    yaw_des = in(4);
    
    %% Control de altitud
   erle.Z_des_filt = (erle.Z_TI_F/(erle.Z_TI_F+erle.Tm))*erle.Z_des_filt_1 + (erle.Tm/(erle.Z_TI_F+erle.Tm))*Z_des;
   % Cálculo del error
   Z_ek = erle.Z_des_filt - erle.Z_GF;
   % Incremento de la integral del error
    erle.Z_Int_ek = erle.Z_Int_ek + erle.Tm*Z_ek;
    % Controlador PI
    U1 = (+(erle.Z_KP*(Z_ek + (1/erle.Z_TI)*erle.Z_Int_ek + erle.Z_TD*((Z_ek-erle.Z_ek_1)/erle.Tm))));
    % Saturación
    U1 = min(erle.U1_max,max(erle.U1_min,U1));
    
    erle.Z_des_filt_1 = erle.Z_des_filt;
    erle.Z_ek_1 = Z_ek;
    
   %% Control del roll
   erle.roll_des_filt = (erle.roll_TI_F/(erle.roll_TI_F+erle.Tm))*erle.roll_des_filt_1 + (erle.Tm/(erle.roll_TI_F+erle.Tm))*roll_des;
   % Cálculo del error
   roll_ek = erle.roll_des_filt - erle.roll;
   % Incremento de la integral del error
    erle.roll_Int_ek = erle.roll_Int_ek + erle.Tm*roll_ek;
   % Controlador PI
    p_des = erle.roll_KP*(roll_ek + (1/erle.roll_TI)*erle.roll_Int_ek + erle.roll_TD*((roll_ek-erle.roll_ek_1)/erle.Tm));
    % Saturación
    p_des = min(erle.p_max,max(-erle.p_max,p_des));
    
    erle.roll_des_filt_1 = erle.roll_des_filt;
    erle.roll_ek_1 = roll_ek;
    
    %% Control del pitch
   erle.pitch_des_filt = (erle.pitch_TI_F/(erle.pitch_TI_F+erle.Tm))*erle.pitch_des_filt_1 + (erle.Tm/(erle.pitch_TI_F+erle.Tm))*pitch_des;
   % Cálculo del error
   pitch_ek = erle.pitch_des_filt - erle.pitch;
   % Incremento de la integral del error
    erle.pitch_Int_ek = erle.pitch_Int_ek + erle.Tm*pitch_ek;
   % Controlador PI
    q_des = erle.pitch_KP*(pitch_ek + (1/erle.pitch_TI)*erle.pitch_Int_ek + erle.pitch_TD*((pitch_ek-erle.pitch_ek_1)/erle.Tm));
    % Saturación
    q_des = min(erle.q_max,max(-erle.q_max,q_des));
    
    erle.pitch_des_filt_1 = erle.pitch_des_filt;
    erle.pitch_ek_1 = pitch_ek;
    
    %% Control del yaw
   erle.yaw_des_filt = (erle.yaw_TI_F/(erle.yaw_TI_F+erle.Tm))*erle.yaw_des_filt_1 + (erle.Tm/(erle.yaw_TI_F+erle.Tm))*yaw_des;
   % Cálculo del error
   yaw_ek = erle.yaw_des_filt - erle.yaw;
   % Incremento de la integral del error
    erle.yaw_Int_ek = erle.yaw_Int_ek + erle.Tm*yaw_ek;
   % Controlador PI
    r_des = erle.yaw_KP*(yaw_ek + (1/erle.yaw_TI)*erle.yaw_Int_ek + erle.yaw_TD*((yaw_ek-erle.yaw_ek_1)/erle.Tm));
    % Saturación
    r_des = min(erle.r_max,max(-erle.r_max,r_des));
    
    erle.yaw_des_filt_1 = erle.yaw_des_filt;
    erle.yaw_ek_1 = yaw_ek;
    
    out = [U1,p_des,q_des,r_des];
end