iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x*cos(x) + x*sin(x);
str = 'x*cos(x) + x*sin(x)';
fprintf('Testando Fun��o x*cos(x) + x*sin(x)\n');
fprintf('M�todo da Tangente\n');
Tangente(iteracao, str, func, 1 , 4, 3);
fprintf('M�todo da Bisse��o\n');
Metodo_Bissecao(iteracao, str, func, 1, 4);

iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x - (x^3 / 2);
str = 'x - (x^3 / 2)';
fprintf('Testando Fun��o x - (x^3 / 2)\n');
fprintf('M�todo da Tangente\n');
Tangente(iteracao, str, func, 1 , 4, 3);
fprintf('M�todo da Bisse��o\n');
Metodo_Bissecao(iteracao, str, func, 1, 4);