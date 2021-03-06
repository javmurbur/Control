function [x,y,z] = rotateGFtoBF (X,Y,Z,roll,pitch,yaw)
% Necesaria para pasar vectores en ejes globales a ejes cuerpo 
% Rotaci�n con respecto a ejes fijos

cr = cos(roll);
sr = sin(roll);
cp = cos(pitch);
sp = sin(pitch);
cy = cos(yaw);
sy = sin(yaw);

% Rotaci�n en el eje xb(roll)
Rx = [1 0 0;0 cr sr;0 -sr cr];

% Rotaci�n en el eje yb(pitch)
Ry = [cp 0 -sp;0 1 0;sp 0 cp];

%Rotaci�n en el eje zb(yaw)
Rz = [cy sy 0;-sy cy 0;0 0 1];

RGB = Rz*Ry*Rx;

Pos = RGB*[X;Y;Z];

x = Pos(1,1);
y = Pos(2,1);
z = Pos(3,1);

end