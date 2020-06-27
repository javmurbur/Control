global erle

erle_variables

%% Defeinición de las coordenadas iniciales

erle.plot_arm = 0.141; %Distancia del centro de masas a cada rotor
erle.plot_arm_t = 0.02; % Grosor del brazo
erle.plot_prop = .08; %Radio de las aspas


%Para el brazo que iría en el eje Y
% En las gráficas de matlab el X es el eje horizontal y el Y el vertical

%                            ^ Y
%                            |
%           4 x------------------------------x 3 
%      ------ |              |               |-------> X
%           1 x------------------------------x 2
%                            |

z_positiva = erle.plot_arm_t;
z_negativa = -erle.plot_arm_t;


%Matriz  con los vértices del brazo
vertex_matrix_2 = [-0.083,-0.115,z_negativa;
                 0.115,0.083,z_negativa;
                 0.083,0.115,z_negativa;
                 -0.115,-0.083,z_negativa;
                 -0.083,-0.115,z_positiva;
                 0.115,0.083,z_positiva;
                 0.083,0.115,z_positiva;
                 -0.115,-0.083,z_positiva];

             
%Matriz que indica las uniones de los vértices (8 vertices)
face_matrix = [1 2 6 5;
               2 3 7 6;
               3 4 8 7;
               4 1 5 8;
               1 2 3 4;
               5 6 7 8];

% X_arm = patch('faces',face_matrix,'vertices',vertex_matrix_rotate,'facecolor','b','edgecolor',[0 0 0],'facecolor','g');   
X_arm = patch('faces',face_matrix,'vertices',vertex_matrix_2,'facecolor','b','edgecolor',[0 0 0],'facecolor','b');            
% 
% % %Para el brazo que va en el eje X de sistema Inercial
% % 
y_positiva = erle.plot_arm;
y_negativa = -erle.plot_arm;
x_positiva = erle.plot_arm_t;
x_negativa = -erle.plot_arm_t;
z_positiva = erle.plot_arm_t;
z_negativa = -erle.plot_arm_t;

%Matriz  con los vértices del brazo

             
vertex_matrix_2 = [-0.115,0.083,z_negativa;
                   0.083,-0.115,z_negativa;
                   0.115,-0.083,z_negativa;
                   -0.083,0.115,z_negativa;
                   -0.115,0.083,z_positiva;
                   0.083,-0.115,z_positiva;
                   0.115,-0.083,z_positiva;
                   -0.083,0.115,z_positiva];
         
Y_arm = patch('faces',face_matrix,'vertices',vertex_matrix_2,'facecolor','b','edgecolor',[0 0 0],'facecolor','b');

%Motores
t = 0:pi/10:2*pi;
X = erle.plot_prop*cos(t);
Y = erle.plot_prop*sin(t);
Z = zeros(size(t)) + erle.plot_arm_t;
C = zeros(size(t));
erle.C = C;
hold on;
fplot(0,[-0.15 0.15],'r');
hold on;
y = -0.15:0.01:0.15;
x = zeros(size(y));
plot(x,y,'r');

Motor0 = patch(X+0.1,Y-0.1,Z,C,'facealpha',.1,'facecolor','g');
Motor1 = patch(X-0.1,Y+0.1,Z,C,'facealpha',.1,'facecolor','k');
Motor2 = patch(X+0.1,Y+0.1,Z,C,'facealpha',.1,'facecolor','k');
Motor3 = patch(X-0.1,Y-0.1,Z,C,'facealpha',.1,'facecolor','k');
% Motor0 = patch(X-0.1,Y+0.1,Z,C,'facealpha',.1,'facecolor','g');
% Motor1 = patch(X+0.1,Y-0.1,Z,C,'facealpha',.1,'facecolor','k');
% Motor2 = patch(X-0.1,Y-0.1,Z,C,'facealpha',.1,'facecolor','k');
% Motor3 = patch(X+0.1,Y+0.1,Z,C,'facealpha',.1,'facecolor','k');

 %Coordinates of each face in each axis (4 coordinates x 6 faces)
 erle.X_armX = get(X_arm,'xdata');
 erle.X_armY = get(X_arm,'ydata');
 erle.X_armZ = get(X_arm,'zdata');
 
 erle.Y_armX = get(Y_arm,'xdata');
 erle.Y_armY = get(Y_arm,'ydata');
 erle.Y_armZ = get(Y_arm,'zdata');
  
 %Coordinates of each rotor in each axis (21 coordinates x 1 face)
 erle.Motor0X = get(Motor0,'xdata');
 erle.Motor0Y = get(Motor0,'ydata');
 erle.Motor0Z = get(Motor0,'zdata');

 erle.Motor1X = get(Motor1,'xdata');
 erle.Motor1Y = get(Motor1,'ydata');
 erle.Motor1Z = get(Motor1,'zdata');
 
 erle.Motor2X = get(Motor2,'xdata');
 erle.Motor2Y = get(Motor2,'ydata');
 erle.Motor2Z = get(Motor2,'zdata');
 
 erle.Motor3X = get(Motor3,'xdata');
 erle.Motor3Y = get(Motor3,'ydata');
 erle.Motor3Z = get(Motor3,'zdata');