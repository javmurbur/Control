global erle

roll = erle.roll;
pitch = erle.pitch;
yaw = erle.yaw;
t = .02;
%% Dibujar brazos del quadrotor

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.X_armX,erle.X_armY,erle.X_armZ,roll,pitch,yaw);
set(erle.X_arm,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Y_armX,erle.Y_armY,erle.Y_armZ,roll,pitch,yaw);
set(erle.Y_arm,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z));

%% Dibujar los motores

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor0X,erle.Motor0Y,erle.Motor0Z,roll,pitch,yaw);
set(erle.Motor0,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z-2*t));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor1X,erle.Motor1Y,erle.Motor1Z,roll,pitch,yaw);
set(erle.Motor1,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z-2*t));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor2X,erle.Motor2Y,erle.Motor2Z,roll,pitch,yaw);
set(erle.Motor2,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z-2*t));

[erle.Xtemp,erle.Ytemp,erle.Ztemp] = rotateBFtoGF(erle.Motor3X,erle.Motor3Y,erle.Motor3Z,roll,pitch,yaw);
set(erle.Motor3,'xdata',erle.Xtemp+erle.X,'ydata',+(erle.Ytemp+erle.Y),'zdata',-(erle.Ztemp+erle.Z-2*t));
