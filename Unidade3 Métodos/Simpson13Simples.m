%Tal como a Regra dos Trapézios, trata-se de outro exemplo de Fórmula de
%Newton-Cotes fechada, mas, ao invés de considerarmos a aproximação em cada 
%sub-intervalo através de um polinómio interpolador do 1º grau (recta), 
%podemos pensar numa aproximação um pouco melhor, considerando um polinómio
%interpolador do 2º grau (parábola). Para isso, ao considerarmos a regra de 
%integração simples, precisamos de um ponto adicional, que será o ponto médio.

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
     
    fprintf('O erro estipulado é: %.8f\n',double(erro));
    fprintf('Intervalo de erro: %.8f +/- %.8f\n', double(resul) ,double(erro));
end