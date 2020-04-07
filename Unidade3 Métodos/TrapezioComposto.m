%Regra dos Trapézios (Composta)
%Como é claro, se usassemos a regra dos trapézios simples para calcular 
%o integral num intervalo [a, b], iamos obter uma aproximação grosseira 
%do valor do integral, por isso, interessa-nos decompor esse intervalo em
%sub-intervalos cada vez mais pequenos, e nesses sub-intervalos aplicamos 
%a regra dos trapézios simples. Trata-se, neste caso, de fazer 
%uma aproximação, da função integranda, usando um spline linear.

function  TrapezioComposto(equacao, a, b, valorReal, N)
    fprintf('\n\nCalculo utilizando trapézio composto: \n');
    fun = sym(equacao);
    resul = 0;
    for i=2:N+1
        xi = linspace(0, 0.8, N+1);
        ant = i-1;
        Fa = subs(fun,xi(ant));
        Fb = subs(fun,xi(i));
        resul = resul + (Fa + Fb);
    end
    h = (b-a)/N;
    resul = (h/2)*resul;
    
    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,2);
    erro = abs((b-a)*((h.^2)/12) * subs(derivada, 0.1));
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end