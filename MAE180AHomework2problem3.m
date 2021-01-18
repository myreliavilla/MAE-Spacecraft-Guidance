
e = 0.25


Ea = zeros(5,1)
Mt = pi/4
Ea(1) = Mt


    for k = [ 1 : 1 : 5]
       Ea(k+1) = Ea(k) - (Ea(k)- e*sin(Ea(k)) - Mt1) / (1 - e*cos(Ea(k)))
       xa = abs(Ea(k+1) - Ea(k))
       if xa < 1e-6
           disp(k+1)
           disp(Ea(k+1))
           break
       end
    end
    
Mt = (3*pi)/4
Eb = zeros(5,1)
Eb(1) = Mt

    for k = [ 1 : 1 : 5]
       Eb(k+1) = Eb(k) - (Eb(k)- e*sin(Eb(k)) - Mt2) / (1 - e*cos(Eb(k)))
       xb = abs(Eb(k+1) - Eb(k))
       if xb < 1e-6
           disp(k+1)
           disp(Eb(k+1))
           break
       end
    end
    
Mt = pi
Ec = zeros(5,1)
Ec(1) = Mt

    for k = [ 1 : 1 : 5]
       Ec(k+1) = Ec(k) - (Ec(k)- e*sin(Ec(k)) - Mt3) / (1 - e*cos(Ec(k)))
       xc = abs(Ec(k+1) - Ec(k))
       if xc < 1e-6
           disp(k+1)
           disp(Ec(k+1))
           break
       end
    end 
    
    
    
    
Vt1 = 2*atan( sqrt((1+e)/(1-e))*tan((xa)/2))
Vt2 = 2*atan( sqrt((1+e)/(1-e))*tan((xb)/2))
Vt3 = 2*atan( sqrt((1+e)/(1-e))*tan((xc)/2))
    
    



