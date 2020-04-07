iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x^3 - 2*x + 2;
str = 'x^3 - 2*x + 2';
fprintf('Testando Função x^3 - 2*x + 2\n');
fprintf('Método da Tangente\n');
Tangente(iteracao, str, func, -3 , 3, 4);
 
iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x^3 + 3*x^2 + x - 4;
str = 'x^3 + 3*x^2 + x - 4';
fprintf('Testando Função x^3 + 3*x^2 + x - 4\n');
fprintf('Método da Tangente\n');
Tangente(iteracao, str, func, -3 , 1, -3);

iteracao = input('Informe a quantidade de iteracoes\n');
func = @(x)x^3 - 2*x + 2;
str = 'x^3 - 2*x + 2';
fprintf('Testando Função x^3 - 2*x + 2\n');
fprintf('Método da Tangente\n');
Tangente(iteracao, str, func, -3 , 3, 0);