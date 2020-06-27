function PID_inverso(KP,TI,TD)
z2 = (TI + sqrt(TI^2 + 4*TI*TD))/2
z1 = (TI*TD)/z2
K = KP/TI
end