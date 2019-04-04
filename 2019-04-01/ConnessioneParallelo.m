% Pulizia ambiente
clear
% Pulizia console
clc

% Definizione sistemi
Sys_A = zpk(1, [-2 -3], 1);
Tf_Sys_A = tf(Sys_A)
Sys_B = zpk(1, [-3 -1], 3);
Tf_Sys_B = tf(Sys_B)

% Parallelo con parallel
Sys_Parallel_with_parallel = parallel(Sys_A, Sys_B);
Tf_Parallel_with_parallel = tf( Sys_Parallel_with_parallel )

% Parallelo con connect
%
%      /--S1--y1--\
% --u--|          +--y--
%      \--S2--y2--/
%

% La u é comune
Sys_A.u = 'u';
Sys_B.u = 'u';

% Y separate
Sys_A.y = 'y1';
Sys_B.y = 'y2';

% Nodo sommatore con uscita y
Sum = sumblk('y = y1 + y2');

% Sistema interconnesso
Sys_Parallel_with_connect = connect(Sys_A, Sys_B, Sum, 'u', 'y');
Tf_Parallel_with_connect = tf( Sys_Parallel_with_connect )

% Studio controllabilitá / osservabilitá
Controllable_Rank = rank(ctrb(Sys_Parallel_with_connect))
Observable_Rank = rank(obsv(Sys_Parallel_with_connect))

% Studio stabilitá
Poles_A = pole(Tf_Sys_A)
Poles_B = pole(Tf_Sys_B)
Poles_all = pole(Tf_Parallel_with_connect)