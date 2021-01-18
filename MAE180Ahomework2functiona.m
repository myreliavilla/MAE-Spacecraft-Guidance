function [ea,ta,errflag]=ma_to_ea(ma,ecc,nmax,eps)
%
% Employs Newton's method to obtain the eccentric
% anomaly from the mean anomaly.
%
% input variables:
%   ma - mean anomaly
%   ecc - eccentricity
%   nmax - maximum allowable number of iterations
%   eps - We will say we've converged if |f(E)|<eps.
%
% output variables:
%   ea - eccentric anomaly
%   errflag - 0 if successful computation,
%             1 if no convergence,
%             2 if mean anomaly check failed.
%
% functions called:
%   none
%
errflag=0;
ea0=ma;
converged=0;
%
% Begin Newton's method.
%
for it=1:nmax
  f=ea0-(ecc*sin(ea0)+ma);
  if abs(f)<eps
    converged=1;
    break;
  end;
  fder=1-ecc*cos(ea0);
  ea1=ea0-f/fder;
  ea0=ea1;
end;
if converged~=1
  errflag=1;
  ea=ea1;
else
  ea=ea0;
  ta = 2*atan(sqrt((1+e)/(1-e))*tan(ea/2))
end;
%
% Check.
%
macheck=ea-ecc*sin(ea);
if abs(ma-macheck)>10*eps
  errflag=2;
end;

%for mean anomoly 0 to pi with increments of .01
%[ a b] 
% x = []
%y = []
%for m = 0: .1: pi
%[a b] = ma_to_ea(m, .25, 20, 10e-6)
% x = [x a]
% y = [y a]
%end
%m = 0: .1: pi 
%plot (m,x, m,y)
%hold on
