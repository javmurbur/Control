function out = position_control(in)

X_GF = in(1);
Y_GF = in(2);

global erle;

 %% Control de X
   erle.X_des_filt = (2.5/(2.5+erle.Tm))*erle.X_des_filt_1 + (erle.Tm/(2.5+erle.Tm))*X_GF;
% Cálculo del error
   X_ek = erle.X_des_filt - erle.X_GF;
   % Incremento de la integral del error
    erle.X_Int_ek = erle.X_Int_ek + erle.Tm*X_ek;
    % Controlador PID
    erle.pitch_des = ((0.1271*(X_ek + erle.X_Int_ek/7.5000 + 1.6667*((X_ek - erle.X_ek_1)/erle.Tm))));
% Saturación
    erle.pitch_des = +erle.pitch_des;
    erle.pitch_des = min(erle.pitch_max,max(-erle.pitch_max,erle.pitch_des));
    
    erle.X_des_filt_1 = erle.X_des_filt;
    erle.X_ek_1 = X_ek;
    
 %% Control de Y
   erle.Y_des_filt = (2.5/(2.5+erle.Tm))*erle.Y_des_filt_1 + (erle.Tm/(2.5+erle.Tm))*Y_GF;
% Cálculo del error
   Y_ek = erle.Y_des_filt - erle.Y_GF;
   % Incremento de la integral del error
    erle.Y_Int_ek = erle.Y_Int_ek + erle.Tm*Y_ek;
    % Controlador PI
    erle.roll_des = ((0.1271*(Y_ek + erle.Y_Int_ek/7.5000 + 1.6667*((Y_ek - erle.Y_ek_1)/erle.Tm))));
% Saturación
    erle.roll_des = -erle.roll_des;
    erle.roll_des = min(erle.roll_des,max(-erle.roll_des,erle.roll_des));
    
    erle.Y_des_filt_1 = erle.Y_des_filt;
    erle.Y_ek_1 = Y_ek;
    
    out = [erle.roll_des,erle.pitch_des];
    
end

