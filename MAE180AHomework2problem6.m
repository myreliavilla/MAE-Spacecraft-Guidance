Mt = 1.93
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
    
    
    Vt3 = 2*atan( sqrt((1+e)/(1-e))*tan((xc)/2))
