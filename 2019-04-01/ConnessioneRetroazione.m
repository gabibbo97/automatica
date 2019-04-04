% Pulizia ambiente
clear
clc

% Definizione sistemi
Sys_Direct = zpk([], [-1 -3], 1);
Sys_Inverse = zpk([3 5], [-2], 2);

% Retroazione con la funzione
Sys_Feedback = feedback(Sys_Direct, Sys_Inverse)

% Retroazione con connect
Sys_Direct.u = 'u1';
Sys_Direct.y = 'y';
Sys_Inverse.u = 'y';
Sys_Inverse.y = 'y2';
Sum = sumblk('u1 = u - y2');
Sys_Connect = connect(Sys_Direct, Sys_Inverse, Sum, 'u', 'y');
Sys_Connect_Tf = tf(Sys_Connect)