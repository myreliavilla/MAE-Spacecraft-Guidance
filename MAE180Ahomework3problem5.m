%prompt1 = ' input a ';
%prompt2 = 'input e';
%prompt3 = 'input i';
%prompt4 = 'input omega';
%prompt5 = 'input w';
%prompt6 = 'input tao';
%prompt7 = 'input mu_Gm'
%prompt8 = 'input time range';
%a = input(prompt1)
%ecc = input(prompt2)
%i = input(prompt3)
%omega = input(prompt4)
%w = input(prompt5)
%tao = input(prompt6)
%mu_Gm = input(prompt7)
%timerange = input(prompt8)


a = 10000;
ecc = 0.3;
i = pi/6;
omega = pi/3;
w = pi/4;
mu_Gm = 42828;
ti = 3*60*60
tf = 9*60*60
timerange = tf-ti;
nmax = 20;
eps = 10e-6




n = sqrt(mu_Gm/a^3);
ttau = timerange;

ma = n*(ttau)





[ea,errflag] = ma_to_ea(ma,ecc,nmax,eps)
    

var = sqrt((1+ecc)/(1-ecc))*tan(ea/2);
anamoly = 2*atan(var)
rt_peri = ((a*(1-ecc^2))/(1+(ecc*cos(anamoly))))*[cos(anamoly); sin(anamoly);0];
%vt = (sqrt(mu/(a*(1-e^2))))*[-sin(anamoly); e+cos(anamoly);0];
display(rt_peri)




G1i = [1 0 0; 0 cos(i) -sin(i); 0 sin(i) cos(i)];
G3o = [cos(omega) -sin(omega) 0; sin(omega) cos(omega) 0; 0 0 1];
G3w = [cos(w) -sin(w) 0; sin(w) cos(w) 0; 0 0 1];

rmt = G3o* (G1i * (G3w * rt_peri));
display (rmt)
a = 10000;
ecc = 0.3;
i = pi/6;
omega = pi/3;
w = pi/4;
mu_Gm = 42828;
ti = 3*60*60
tf = 9*60*60
timerange = tf-ti;
nmax = 20;
eps = 10e-6




n = sqrt(mu_Gm/a^3);
ttau = timerange;

ma = n*(ttau)





[ea,errflag] = ma_to_ea(ma,ecc,nmax,eps)
    

var = sqrt((1+ecc)/(1-ecc))*tan(ea/2);
anamoly = 2*atan(var)
rt_peri = ((a*(1-ecc^2))/(1+(ecc*cos(anamoly))))*[cos(anamoly); sin(anamoly);0];
%vt = (sqrt(mu/(a*(1-e^2))))*[-sin(anamoly); e+cos(anamoly);0];
display(rt_peri)




G1i = [1 0 0; 0 cos(i) -sin(i); 0 sin(i) cos(i)];
G3o = [cos(omega) -sin(omega) 0; sin(omega) cos(omega) 0; 0 0 1];
G3w = [cos(w) -sin(w) 0; sin(w) cos(w) 0; 0 0 1];

rmt = G3o* (G1i * (G3w * rt_peri));
display (rmt)



%k = 1;
%E(1) = ma;
%E(2) = E(1) - E(1) - ecc*sin(E(1)-ma)/(1-ecc*cos(E(1)))
%E(k) - (E(k)- e*sin(E(k)) - Mt2) / (1 - e*cos(E(k)))
%absolute = abs(E(k+1) - E(k));


%if absolute > 1e-6
     %E(k+1) = E(k) - (E(k)- e*sin(E(k)) - Mt) / (1 - e*cos(E(k)))
    %k = k +1;
    %absolute = abs(E(k) - E(k-1));
%else  disp ('error')
%end









