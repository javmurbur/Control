function ecuaciones_dinamicas
global erle;
    erle.q_d = erle.U3/erle.Iyy;
    erle.q = erle.q_d*erle.Tm + erle.q;
    erle.pitch = erle.q*erle.Tm + erle.pitch;
    
    erle.pitch_plot(erle.indice) = erle.pitch;
    erle.q_plot(erle.indice) = erle.q;
    erle.U3_plot(erle.indice) = erle.U3;
end