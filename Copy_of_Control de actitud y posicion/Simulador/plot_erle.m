
function plot_erle
global erle

%% Dibujar brazos del quadrotor

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.X_armX,erle.X_armY,erle.X_armZ,erle.roll,erle.pitch,erle.yaw);
set(erle.X_arm,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Y_armX,erle.Y_armY,erle.Y_armZ,erle.roll,erle.pitch,erle.yaw);
set(erle.Y_arm,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

%% Dibujar los motores

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor0X,erle.Motor0Y,erle.Motor0Z,erle.roll,erle.pitch,erle.yaw);
set(erle.Motor0,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor1X,erle.Motor1Y,erle.Motor1Z,erle.roll,erle.pitch,erle.yaw);
set(erle.Motor1,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor2X,erle.Motor2Y,erle.Motor2Z,erle.roll,erle.pitch,erle.yaw);
set(erle.Motor2,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor3X,erle.Motor3Y,erle.Motor3Z,erle.roll,erle.pitch,erle.yaw);
set(erle.Motor3,'xdata',erle.Xtemp+erle.X_GF,'ydata',+(erle.Ytemp+erle.Y_GF),'zdata',-(-erle.Ztemp-erle.Z_GF));

drawnow;

end