function y = f(m)
    g = 9.8
    cD = 0.25
    t = 4
    v = 36
    y=sqrt(g*m/cD)*tanh(sqrt(g*cD/m)*t)-v
endfunction
