%Convém referir que, enquanto a Regra dos Trapézios composta corresponde
%a fazer a aproximação da função integranda através de um spline linear,
%no caso da Regra de Simpson composta, a aproximação feita não corresponde 
%a um spline de grau 2, pois não exigimos regularidade da derivada nos nós. 
%Essa regularidade não é necessária quando integramos. Aliás, geometricamente 
%depreende-se que, exigir a regularidade da função aproximadora, nos nós, 
%não traz aparentes vantagens para a aproximação da área delimitada 
%pelo gráfico da função

function  Simpson13Composta(equacao, a, b, valorReal,N)
    fprintf('\n\nCalculo utilizando Regra de Simpson 1/3 Composta: \n');
    resul = 0;
    fun = sym(equacao);
    for i=1:N/2   
        xi = linspace(0, 0.8, N+1);
        ant = 2*i -2;
        meio = 2*i -1;
        dep = 2*i;
        Fa = subs(fun,xi(ant+1));
        Fc = subs(fun,xi(meio+1));
        Fb = subs(fun,xi(dep+1));
        resul = resul + (Fa + 4*Fc + Fb);
    end
    
    h = (b-a)/N;
    resul = (h/3)*resul;

    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,4);
    erro = abs((b-a)*((h.^4)/180) * subs(derivada, 0.1));
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end