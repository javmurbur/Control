function Modelo(con_KD)
m = 1.12; % (Kg)
Kd = 8.06428e-5;

%% Con/Sin Kd
if con_KD
    G = tf([1],[m Kd 0])
else
    G = tf([1],[m 0 0]) 
end

rltool(G);

%% Con/Sin Kd
if con_KD
    C = zpk([-10 -5],[0],2909.8);
    F = zpk([],[-1],1);
else
    C = zpk([-1 -1],[0],7.56);
    F = zpk([],[-1],1);
end

end