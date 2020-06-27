function [p_ref,q_ref,r_ref] = referencias(in)

time = in(1);
global erle;

    if(time < erle.T_escalon_p)
        erle.p_des = 0;
    end
    if(time >= erle.T_escalon_p)
        
        erle.p_des = 20*(erle.Deg_Rad);
    end
    % Señal de entrada q_des
    if(time < erle.T_escalon_q)
        erle.q_des = 0;
    end
    if(time >= erle.T_escalon_q)
        erle.p_des = 0;
        erle.q_des = 20*(erle.Deg_Rad);
    end
    % Señal de entrada r_des
    if(time < erle.T_escalon_r)
            erle.r_des = 0;
    end
    if(time >= erle.T_escalon_r)
    erle.p_des = 0;
    erle.q_des = 0;
    erle.r_des = 20*(erle.Deg_Rad);
    end

end