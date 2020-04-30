function [TI,TD,KP,KI,KD] = calculo_PID(K,z1,z2)

TDI = (z1*z2);
TI = (z1+z2);

TD = TDI/TI;

KP = K*TI;
KI = K;
KD = KP*TD;

end