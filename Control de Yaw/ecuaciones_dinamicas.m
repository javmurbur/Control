function ecuaciones_dinamicas
global erle;
    erle.r_d = erle.U4/erle.Izz;
    erle.r = erle.r_d*erle.Tm + erle.r;
    erle.yaw = erle.r*erle.Tm + erle.yaw;
    
    erle.yaw_plot(erle.indice) = erle.yaw;
    erle.r_plot(erle.indice) = erle.r;
    erle.U4_plot(erle.indice) = erle.U4;
end