%% Store data in global variable
load erle_plotting_model

erle.X_arm = patch('xdata',erle.X_armX,'ydata',erle.X_armY,'zdata',erle.X_armZ,'facealpha',.9,'facecolor','b');
erle.Y_arm = patch('xdata',erle.Y_armX,'ydata',erle.Y_armY,'zdata',erle.Y_armZ,'facealpha',.9,'facecolor','b');
erle.Motor0 = patch('xdata',erle.Motor0X,'ydata',erle.Motor0Y,'zdata',erle.Motor0Z,'facealpha',.3,'facecolor','g');
erle.Motor1 = patch('xdata',erle.Motor1X,'ydata',erle.Motor1Y,'zdata',erle.Motor1Z,'facealpha',.3,'facecolor','k');
erle.Motor2 = patch('xdata',erle.Motor2X,'ydata',erle.Motor2Y,'zdata',erle.Motor2Z,'facealpha',.3,'facecolor','k');
erle.Motor3 = patch('xdata',erle.Motor3X,'ydata',erle.Motor3Y,'zdata',erle.Motor3Z,'facealpha',.3,'facecolor','k');