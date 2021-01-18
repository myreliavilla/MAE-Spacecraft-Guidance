lambda = (3*pi)/4;
phi = pi/3;


A = [cos(lambda) -sin(lambda) 0; sin(lambda) cos(lambda) 0; 0 0 1];
B = [cos(phi) 0 -sin(phi); 0 1 0; sin(phi) 0 cos(phi)];
C = [0 0 1; 1 0 0; 0 1 0];
D = [100; -500; 2000];
E = [-2260.69; 2260.69; 5500.49];


ECEF = (A*B*C*D) + E

theta = 1e5;


F =[cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];

Result = F * ECEF


wttau= 1.05;
w = 7.292e-5;

A1 = [cos(wttau) -sin(wttau) 0; sin(wttau) cos(wttau) 0; 0 0 1];
VECEF = [-8.1063; -3.2074; 2.000];

G = [-w*sin(wttau) -w*cos(wttau) 0;w*cos(wttau) -w*sin(wttau) 0; 0 0 0];
RECEF = [-3344.7; 3203.3; 6982.3];


Result2 = (A1*VECEF) + (G*RECEF)
