function [X,Y,Z] = rotateBFtoGF (x,y,z,roll,pitch,yaw)
% Necesaria para pasar vectores en ejes cuerpo a ejes globales
% Rotación con respecto a ejes fijos

cr = cos(roll);
sr = sin(roll);
cp = cos(pitch);
sp = sin(pitch);
cy = cos(yaw);
sy = sin(yaw);

% Rotación en el eje xb(roll)
Rx = [1 0 0;0 cr sr;0 -sr cr];

% Rotación en el eje yb(pitch)
Ry = [cp 0 -sp;0 1 0;sp 0 cp];

%Rotación en el eje zb(yaw)
Rz = [cy sy 0;-sy cy 0;0 0 1];

RBG = Rx'*Ry'*Rz';

B = size(x);
for i=1:B(2)*B(1)
    pts = RBG*[x(i);y(i);z(i)];
    pts = pts';
    X(i) = pts(:,1);
    Y(i) = pts(:,2);
    Z(i) = pts(:,3);
    
end

end