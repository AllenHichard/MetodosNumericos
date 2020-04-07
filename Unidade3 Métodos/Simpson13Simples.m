%Tal como a Regra dos Trap�zios, trata-se de outro exemplo de F�rmula de
%Newton-Cotes fechada, mas, ao inv�s de considerarmos a aproxima��o em cada 
%sub-intervalo atrav�s de um polin�mio interpolador do 1� grau (recta), 
%podemos pensar numa aproxima��o um pouco melhor, considerando um polin�mio
%interpolador do 2� grau (par�bola). Para isso, ao considerarmos a regra de 
%integra��o simples, precisamos de um ponto adicional, que ser� o ponto m�dio.

function  Simpson13Simples(equacao, a, b, valorReal)
    fprintf('\n\nCalculo utilizando Regra de Simpson 1/3 simples: \n');
    fun = sym(equacao);
    c = (a+b)/2;
    h = (b-a)/2;
    Fa = subs(fun,a);
    Fb = subs(fun,b);
    Fc = subs(fun,c);
    resul = (Fa + 4*Fc + Fb)*h/3; 

    fprintf('Valor encontrado: %.8f\n',double(resul));
    Ea = ((valorReal - double(resul))/ valorReal)*100;
    fprintf('Erro verdadeiro percentual: %.8f\n', Ea);
    
    derivada = diff(fun,4);
    erro = abs(((h.^5) * subs(derivada, 0.1)/90));
     
    fprintf('O erro estipulado �: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end