function [fobj] = bio(par)
    x=par(1);
    y=par(2);
    eq1= (x*0.2) + (y*0.5) - 1;
    eq2= (x*0.3) + (y*0.2) - 0.6;
    fobj=(eq1^2)+(eq2^2);
