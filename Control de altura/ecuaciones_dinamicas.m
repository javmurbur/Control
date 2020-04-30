function ecuaciones_dinamicas

   global erle;
    
   erle.Z_dd = ((-erle.U1)/erle.m) + erle.g;
   erle.Z_d = erle.Z_dd*erle.Tm + erle.Z_d;
   erle.Z = erle.Z_d*erle.Tm + erle.Z;
   
   erle.Z_plot(erle.indice) = erle.Z;
   erle.U1_plot(erle.indice) = erle.U1;
   erle.Z_d_plot(erle.indice) = erle.Z_d;
   erle.Z_dd_plot(erle.indice) = erle.Z_dd;
   
end