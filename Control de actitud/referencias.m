function out = referencias(in)

time = in(1);
global erle;

    if(time < erle.T_escalon_roll)
        roll_des = 0;
    end
    if(time >= erle.T_escalon_roll)
        
        roll_des = erle.roll_des*(erle.Deg_Rad);
    end
    % Señal de entrada q_des
    if(time < erle.T_escalon_pitch)
        pitch_des = 0;
    end
    if(time >= erle.T_escalon_pitch)
        pitch_des = erle.pitch_des*(erle.Deg_Rad);
    end
    % Señal de entrada r_des
    if(time < erle.T_escalon_yaw)
            yaw_des = 0;
    end
    if(time >= erle.T_escalon_yaw)
        roll_des = 0;
    yaw_des = erle.yaw_des*(erle.Deg_Rad);
    end
out = [roll_des,pitch_des,yaw_des];
end