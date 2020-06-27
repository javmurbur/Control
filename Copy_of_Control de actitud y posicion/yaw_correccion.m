function out = yaw_correccion(in)

roll_des = in(1);
pitch_des = in(2);

global erle;

pitch_des_yaw = cos(erle.yaw)*pitch_des - sin(erle.yaw)*roll_des;
roll_des_yaw = sin(erle.yaw) * pitch_des + cos(erle.yaw) * roll_des;

  erle.roll_des_plot(erle.indice) = roll_des*erle.Rad_Deg;
  erle.pitch_des_plot(erle.indice) = pitch_des*erle.Rad_Deg;
  
  out = [roll_des_yaw,pitch_des_yaw];
end