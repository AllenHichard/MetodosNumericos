function  Simpson38Composta(equacao, a, b, valorReal,N)
    fprintf('\n\nCalculo utilizando Regra de Simpson 3/8 Composta: \n');
    resul = 0;
    fun = sym(equacao);
    
    for i=1:N/3
        xi = linspace(0, 0.8, N+1);
        a1 = 3*i -3;
        b2 = 3*i -2;
        c = 3*i -1;
        d = 3*i -0;
        Fa = subs(fun,xi(a1+1));
        Fb = subs(fun,xi(b2+1));
        Fc = subs(fun,xi(c+1));
        Fd = subs(fun,xi(d+1));
        resul = resul + (Fa + 3*Fb + 3*Fc + Fd);
       
    end
    
    h = (b-a)/N;
    resul = resul*(h*(3/8));

    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,4);
    erro = abs((b-a)*((h.^4)/80) * subs(derivada, 0.1));
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end