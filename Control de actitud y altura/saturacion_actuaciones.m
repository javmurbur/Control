function saturacion_actuaciones

global erle;

w0_2 = erle.U1/(4*erle.Kt) - erle.U2/(2*sqrt(2)*erle.l*erle.Kt) - erle.U3/(2*sqrt(2)*erle.l*erle.Kt) + erle.U4/(4*erle.Kd);
w1_2 = erle.U1/(4*erle.Kt) + erle.U2/(2*sqrt(2)*erle.l*erle.Kt) + erle.U3/(2*sqrt(2)*erle.l*erle.Kt) + erle.U4/(4*erle.Kd);
w2_2 = erle.U1/(4*erle.Kt) + erle.U2/(2*sqrt(2)*erle.l*erle.Kt) - erle.U3/(2*sqrt(2)*erle.l*erle.Kt) - erle.U4/(4*erle.Kd);
w3_2 = erle.U1/(4*erle.Kt) - erle.U2/(2*sqrt(2)*erle.l*erle.Kt) + erle.U3/(2*sqrt(2)*erle.l*erle.Kt) - erle.U4/(4*erle.Kd);

if w0_2 > erle.w_max^2
    w0_2 = erle.w_max^2;
end
if w0_2 < erle.w_min^2
    w0_2 = erle.w_min^2;
end
if w1_2 > erle.w_max^2
    w1_2 = erle.w_max^2;
end
if w1_2 < erle.w_min^2
    w1_2 = erle.w_min^2;
end

if w2_2 > erle.w_max^2
    w2_2 = erle.w_max^2;
end
if w2_2 < erle.w_min^2
    w2_2 = erle.w_min^2;
end

if w3_2 > erle.w_max^2
    w3_2 = erle.w_max^2;
end
if w3_2 < erle.w_min^2
    w3_2 = erle.w_min^2;
end

%% Calculo las velocidades de los motores en (Deg/s)
erle.w0 = sqrt(w0_2);
erle.w1 = sqrt(w1_2);
erle.w2 = sqrt(w2_2);
erle.w3 = sqrt(w3_2);

%% Señales de control
erle.U1 = erle.Kt*(erle.w0^2+erle.w1^2+erle.w2^2+erle.w3^2);
erle.U2 = (sqrt(2)*erle.l*erle.Kt/2)*(+erle.w1^2+erle.w2^2-erle.w0^2-erle.w3^2);
erle.U3 = (sqrt(2)*erle.l*erle.Kt/2)*(-erle.w0^2-erle.w2^2+erle.w1^2+erle.w3^2);
erle.U4 = erle.Kd*(+erle.w0^2+erle.w1^2-erle.w2^2-erle.w3^2);

end