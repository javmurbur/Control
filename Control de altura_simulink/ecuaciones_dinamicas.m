function out = ecuaciones_dinamicas (in)

U1 = in(1);
U2 = in(2);
U3 = in(3);
U4 = in(4);

global erle;

erle.Z_dd = (+(cos(erle.roll)*cos(erle.pitch))*U1)/erle.m - erle.g;

% % Velocidad y posición en Z
erle.Z_d = erle.Z_dd * erle.Tm + erle.Z_d;
erle.Z = erle.Z_d * erle.Tm + erle.Z;
   
   erle.U1_plot(erle.indice) = U1;
   erle.Z_plot(erle.indice) = erle.Z;
   erle.Z_d_plot(erle.indice) = erle.Z_d;
   erle.Z_dd_plot(erle.indice) = erle.Z_dd;
   
   erle.indice = erle.indice + 1;

   out = [erle.Z];

end