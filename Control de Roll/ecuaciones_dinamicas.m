function ecuaciones_dinamicas
global erle;
    erle.p_d = erle.U2/erle.Ixx;
    erle.p = erle.p_d*erle.Tm + erle.p;
    erle.roll = erle.p*erle.Tm + erle.roll;
    
    erle.roll_plot(erle.indice) = erle.roll*erle.Rad_Deg;
    erle.p_plot(erle.indice) = erle.p;
    erle.U2_plot(erle.indice) = erle.U2;
end