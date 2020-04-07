function  Simpson38Simples(equacao, a, b, valorReal)
    fprintf('\n\nCalculo utilizando Regra de Simpson 3/8 simples: \n');
    
    fun = sym(equacao);
    xi = linspace(0, 0.8, 4);
    a1 = xi(1);
    b1 = xi(2);
    c = xi(3);
    d = xi(4);
    h = (b-a)/3;
    Fa = subs(fun,a1);
    Fb = subs(fun,b1);
    Fc = subs(fun,c);
    Fd = subs(fun,d);
    resul = (Fa + 3*Fb + 3*Fc + Fd)*(h*(3/8));
    

    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,4);
    erro = abs(((3/80)*(h.^5) * subs(derivada, 0.1)));
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end