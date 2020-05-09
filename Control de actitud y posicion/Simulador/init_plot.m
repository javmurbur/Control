
%Inicialización del graficado 3D

function init_plot

axes('units','normalized','position',[.2 .1 .6 .8]);
axis equal

axis([-5 5 -5 5 -5 5]);
view(30,30)
grid on
hold on

xlabel('x')

%-----Cámara-----%

camproj perspective
camva(5)
hlight = camlight('headlight');

lighting gouraud
set(gcf,'Renderer','OpenGL')

line([-1 1],[0 0],[0 0])
line([0 0],[-.5 .5],[0 0],'color','r')

end