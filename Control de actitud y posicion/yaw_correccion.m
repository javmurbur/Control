function yaw_correcion

global erle;

erle.pitch_des_yaw = cos(erle.yaw)*erle.pitch_des - sin(erle.yaw)*erle.roll_des;
erle.roll_des_yaw = sin(erle.yaw) * erle.pitch_des + cos(erle.yaw) * erle.roll_des;

  erle.roll_des_plot(erle.indice) = erle.roll_des*erle.Rad_Deg;
  erle.pitch_des_plot(erle.indice) = erle.pitch_des*erle.Rad_Deg;
end