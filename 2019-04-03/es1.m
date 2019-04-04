clear;clc;
%creo il sistema
s = tf('s');
tf1 = 1/s;
tf2 = 1;
ss1 = ss(tf1);
ss2 = ss(tf2);
ss_parallelo = parallel(ss1, ss2);
tf3 = 1/(s+1);
ss3 = ss(tf3);
ss_serie = series(ss_parallelo, ss3);
ss4 = ss(tf1);
sistema = feedback(ss_serie, ss4);

%studio il sistema
%ho visto che si semplifica un polo in -1
rank(obsv(sistema))
rank(ctrb(sistema)) %2, perde osservabilità