 
x = []
y = []
for m = 0: .1: pi
    [a b] = ma_to_ea(m, .25, 20, 10e-6)
    x = [x a]
    y = [y b]
    end
m = 0: .1: pi 
plot (m,x, m,y)

