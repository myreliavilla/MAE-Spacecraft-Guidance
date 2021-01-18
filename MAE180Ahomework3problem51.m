a = 29600;
ecc = 0.5;
i = pi/6;
omega = 0;
w = pi;
mu_Gm = 398600;
ti = 0;
tf = 86164.1;
timerange = tf-ti;
nmax = 1000;
eps = 10e-6;






rpci = [];
rperi = [];
recef = [];


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
    
    
    omega2 = (7.292e-5)*((tf -0));

   G3o_ecef = [cos(omega2) sin(omega2) 0; -sin(omega2) cos(omega2) 0; 0 0 1];
   recef1 = G3o_ecef*rpci1;
   
   recef = [recef recef1];
    
    
    
end


%%omega2 = (7.292e-5)*((86164.1-0));
%%r_ecef = zeros(3,length(omega2));
%%for n = 1:length(omega2)
%%G3o = [cos(omega2) -sin(omega2) 0; sin(omega2) cos(omega2) 0; 0 0 1];
%%r_ecef = G3o*rpci;
%%end

%omega2 = (7.292e-5)*((86164.1-0));
%recef = [];

%for n = 1:length(omega2)
   %G3o_ecef = [cos(omega2) sin(omega2) 0; -sin(omega2) cos(omega2) 0; 0 0 1];
   %recef = [G3o_ecef*rpci];
   
   %recef = [recef recef1];
%end


initial = 3;
final = 9;

sizeofr_v2 = size(rpci,2);
plottime = linspace(initial, (initial+(final-initial)), sizeofr_v2);

tiledlayout(2,2)

hold on; grid on;


title('Plots for Trajectory','FontSize', 12);


nexttile
plot(plottime,rpci,'Linewidth',2)
legend('rpci1','rpci2','rpci3','fontsize',5,'Location','Southeast');
xlabel('Time', 'FontSize', 10);
title('PCI Plot');

nexttile([1,2])
plot3(rpci(1,:),rpci(2,:),rpci(3,:),'Linewidth',2)
title('PCI 3D plot Myrelia I. Villa')
grid on

nexttile
plot(plottime,rperi,'Linewidth',2)
legend('rperi1','rperi2','rperi3','fontsize',5,'Location','Southeast');
xlabel('Time', 'FontSize', 10);
title('Peri Plot');
grid on;

nexttile([1,2])
plot3(rperi(1,:),rperi(2,:),rperi(3,:),'Linewidth',2)
title('Peri 3D plot Myrelia I. Villa')
grid on

nexttile
plot(plottime,recef,'Linewidth',2)
legend('recef1','recef2','recef3','fontsize',5,'Location','Southeast');
xlabel('Time', 'FontSize', 10);
title('ECEF Plot');

nexttile([1,2])
plot3(recef(1,:),recef(2,:),recef(3,:),'Linewidth',2)
title('ECEF 3D plot Myrelia I. Villa')
grid on




