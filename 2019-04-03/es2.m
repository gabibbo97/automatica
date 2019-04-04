%stesso sistema con una u2 in mezzo alla serie
%tricky perchè ingresso vettoriale
clear;clc;

s1_tf=tf([1],[1,0]);
s1_eq=ss(s1_tf);
s1_eq.u='e';s1_eq.y='y1';

s2_tf=tf([1],[1 1]);
s2_eq=ss(s2_tf);
s2_eq.u='w';s2_eq.y='y';

s3_tf=tf([1],[1 0]);
s3_eq=ss(s3_tf);
s3_eq.y ='y3';
s3_eq.u='y';

sum1=sumblk('e=u(1)-y3');
sum2=sumblk('w=u(2)+y1');


sist_conn=connect(s1_eq,s2_eq,s3_eq,sum1,sum2,'u','y');
size(sist_conn);
tff=zpk(minreal(sist_conn));
r1=rank(ctrb(sist_conn)), q1=rank(obsv(sist_conn))

