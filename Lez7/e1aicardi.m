clear;clc;

s1_tf=tf([1],[1,0]);
s1_eq=ss(s1_tf);
s1_eq.u='e';s1_eq.y='y1';

sum2=sumblk('v=e+y1');

s2_tf=tf([1],[1 1]);
s2_eq=ss(s2_tf);
s2_eq.u='v';s2_eq.y='y';

s3_tf=tf([1],[1 0]);
s3_eq=ss(s3_tf);
s3_eq.y ='y3';
sum1=sumblk('e=r-y3');s3_eq.u='y';

sist_conn=connect(s1_eq,s2_eq,s3_eq,sum1,sum2,'r','y');
size(sist_conn);
tff=zpk(minreal(sist_conn));
r1=rank(ctrb(sist_conn)), q1=rank(obsv(sist_conn))

