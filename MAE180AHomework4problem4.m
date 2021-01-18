a = 10000;
ecc = 0.3;
i = pi/6;
omega = pi/3;
w = pi/4;
mu_Gm = 42828;
ti = 3*60*60;
tf = 11*60*60;
%timerange = tf-ti;
nmax = 20;
eps = 10e-6




rpci = [];
rperi = [];
RECEF = [];
lambda2 = [];
phi1 = [];


for tf = ti : 150 : ti+(tf-ti)
    n = sqrt(mu_Gm/a^3);
timerange = tf-ti;

ma = n*(timerange);

    [ea,errflag] = ma_to_ea(ma,ecc,nmax,eps);
    var = sqrt((1+ecc)/(1-ecc))*tan(ea/2);
anamoly = 2*atan(var);
rt_peri = ((a*(1-ecc^2))/(1+(ecc*cos(anamoly))))*[cos(anamoly); sin(anamoly);0];

G1i = [1 0 0; 0 cos(i) -sin(i); 0 sin(i) cos(i)];
G3o = [cos(omega) -sin(omega) 0; sin(omega) cos(omega) 0; 0 0 1];
G3w = [cos(w) -sin(w) 0; sin(w) cos(w) 0; 0 0 1];

rpci1 = G3o* (G1i * (G3w * rt_peri));


    rpci = [rpci rpci1];
    
    rperi = [rperi rt_peri];
    
    
    we = 7.292115e-5;
    theta = we*(timerange);
    
    
  G = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
  
  RECEF1 = G* rpci1;
  
  RECEF = [RECEF RECEF1];
  
  
  aearth = 6378.14;
  bearth = 6356.75;
  
  %e_e = sqrt(1- (bearth^2/aearth^2));
  phi = asin((RECEF1(3,:))/(sqrt((RECEF1(1,:)^2 + RECEF1(2,:)^2 + RECEF1(3,:)^2))));
  u = sqrt(RECEF1(1,:)^2 + RECEF1(2,:)^2);
  lambdasin = asin(RECEF1(2,:)/u);
  lambdacos = acos(RECEF1(1,:)/u);
  
  
  if lambdasin > 1e-6
      lambda = lambdacos;
  elseif lambdasin <= 1e-6
          lambda = (2*pi)-lambdacos;
  end
  
  
  lambda2 = [lambda2 lambda];
  phi1 = [phi1 phi];
  
    
    
end



initial = 3;
final = 11;

sizeofr_v2 = size(rpci,2);
plottime = linspace(initial, (initial+(final-initial)), sizeofr_v2);

tiledlayout(2,2)

hold on; grid on;


title('Plots for Trajectory','FontSize', 12);


nexttile
plot(plottime,RECEF,'Linewidth',2)
%legend('rpci1','rpci2','rpci3','fontsize',5,'Location','Southeast');
xlabel('Time', 'FontSize', 10);


nexttile
plot(lambda2, phi1,'Linewidth',2)
%legend('rperi1','rperi2','rperi3','fontsize',5,'Location','Southeast');
xlabel('Time', 'FontSize', 10);


nexttile([1,2])
plot3(RECEF(1,:),RECEF(2,:),RECEF(3,:),'Linewidth',2)
