%Regra dos Trapézios (simples)
%consiste em considerar um polinômio de primeiro grau que aproxima uma
%função f(x), ou seja, n=1.

function  TrapezioSimples(equacao, a, b, valorReal)
    fprintf('Calculo utilizando trapézio simples: \n');
    fun = sym(equacao);
    Fa = subs(fun,a);
    Fb = subs(fun,b);
    h = (b-a);
    resul =  h/2 * (Fa + Fb);
    
    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,2);
    erro = abs(((h.^3) * subs(derivada, 0.1)/12));
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end