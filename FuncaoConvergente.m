iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x*cos(x) + x*sin(x);
str = 'x*cos(x) + x*sin(x)';
fprintf('Testando Função x*cos(x) + x*sin(x)\n');
fprintf('Método da Tangente\n');
Tangente(iteracao, str, func, 1 , 4, 3);
fprintf('Método da Bisseção\n');
Metodo_Bissecao(iteracao, str, func, 1, 4);

iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x - (x^3 / 2);
str = 'x - (x^3 / 2)';
fprintf('Testando Função x - (x^3 / 2)\n');
fprintf('Método da Tangente\n');
Tangente(iteracao, str, func, 1 , 4, 3);
fprintf('Método da Bisseção\n');
Metodo_Bissecao(iteracao, str, func, 1, 4);