%Integração Numérica
%Equação : 400x^5 - 900x^4 + 675x^3 - 200x^2 + 25x + 0.2
%Valor exato 1.64053334
equacao = @(x)400*x.^5 - 900*x.^4 + 675*x.^3 - 200*x.^2 + 25*x + 0.2;
valorReal = 1.64053334;
fprintf('Função utilizada: 400x^5 - 900x^4 + 675x^3 - 200x^2 + 25x + 0.2\n')
fprintf('Valor Real da área: %.8f\n\n',valorReal);
a = 0; b = 0.8;
TrapezioSimples(equacao, a, b, valorReal);
TrapezioComposto(equacao, a, b, valorReal, 1);
Simpson13Simples(equacao, a, b, valorReal);
Simpson13Composta(equacao, a, b, valorReal,2);
Simpson38Simples(equacao, a, b, valorReal);
Simpson38Composta(equacao, a, b, valorReal,6);