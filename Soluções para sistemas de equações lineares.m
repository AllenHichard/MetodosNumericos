%Allen Hichard Marques dos Santos
%Rodrigo Brito Santos
%Engenharia de computação - Métodos numéricos

%Solução para Sistema de Equação Lineares
%Equações utilizadas
%2x + 5y - 3z = 6 
%3x + 2y + 3z = 2 
%1x + 3y + 2z = 4
A = [2 5 -3; 3 2 3; 1 3 2]; %Coeficientes das equações
B = [6;2;4]; %Vetor resultado de cada equação

fprintf('Resoluções para sistemas de equações lineares\n\n');
fprintf('Solução pela operação inv\n\n');
X = inv(A)*B;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solução pela operador "barra invertida" \n\n');
X = A\B;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solução pela Decomposição LU\n\n');
[L,U] = lu(A);
Y = L\B;
X = U\Y;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solução Linsolve usando decomposição LU com pivotamento\n\n');
X = linsolve(A,B);
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

%O arquivo Bio enviado serve para utilizar esse método intervalar.
%fprintf('Solução usando fsolve');
%mais eficiente
%vamos re-escrever as equações tornando o lado direito igual a zero:
%0.2x + 0.5y = 1
%0.3x + 0.2y = 0.6
%A = 0.2x + 0.5y – 1 = 0
%0.3x + 0.2y - 0.6 = 0
%options = optimset('Display','iter');
%s = fsolve('bio',[2 0.5],options);
%disp(s);
%Para alterar esse método tem que ir no arquivo bio e mudar as equações. 

%Solução para Interpolação Polinomial e mínimos quadrados

fprintf('Resoluções para Interpolação Polinomial\n\n');

%Valores correspondentes de x e y para a interpolação
fprintf('Valores de x\n\n');
x = [2 4 6 8];
fprintf('%f ', round(x));
fprintf('\nValores de f(x)\n\n');
y = [7 3 10 5];
fprintf('%f ', round(y));
funcao = polyfit(x,y,3); % Função para interpolação ou mínimos quadrados
fprintf('\nInterpolando se encontra a função\n\n');
disp(funcao);
intervalo = linspace(0,10);
Fx = polyval(funcao, intervalo);
figure(1);
subplot(1,3,1);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Função ajustada para um grau Cúbico');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados') 

% Caso a função necessite de um grau menor, não será possível interpolar,
% portanto será feito um ajuste de curvas por mínimos quadrados.
fprintf('Resoluções para Ajuste de Curvas minimos quadrados\n');
funcao = polyfit(x,y,2);
fprintf('Ajustando em um grau quadrático se encontra essa função\n');
disp(funcao);
intervalo = linspace(-10,20);
Fx = polyval(funcao, intervalo);
subplot(1,3,2);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Função ajustada para um grau quadrático');
xlabel('Eixo X') 
ylabel('Eixo Y')
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados')

%Solução utilizando Splines Cúbicas

%fprintf('Resoluções para Splines Cúbicas\n\n');
p = spline(x,y);
intervalo = linspace(0,10);
r = ppval(intervalo, p);
subplot(1,3,3);
plot(intervalo, r, 'black', x, y, '+ red');
title('Função ajustada pela Spline');
xlabel('Eixo X') 
ylabel('Eixo Y')
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados');

%A gráfico da Splines foi semelhante ao interpolado, mas de acordo com a
%teória os mesmo possuem caracteristicas diferentes e tendem a ser funções
%diferentes.


fprintf('Outro Exemplo\n\n');
%Valores correspondentes de x e y para a interpolação
fprintf('Valores de x\n\n');
x = [2 5 8];
fprintf('%f ', round(x));
fprintf('\nValores de f(x)\n\n');
y = [7 2 5];
fprintf('%f ', round(y));
funcao = polyfit(x,y,2); 
fprintf('\nInterpolando se encontra a função\n\n');
disp(funcao);
intervalo = linspace(0,10);
Fx = polyval(funcao, intervalo);
figure(2);
subplot(1,3,1);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Função ajustada para um grau quadrático');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados');

% Caso a função necessite de um grau menor, não será possível interpolar,
% portanto será feito um ajuste de curvas por mínimos quadrados.
fprintf('Resoluções para Ajuste de Curvas minimos quadrados\n');
funcao = polyfit(x,y,1);
fprintf('Ajustando em um grau linear se encontra essa função\n');
disp(funcao);
intervalo = linspace(-10,20);
Fx = polyval(funcao, intervalo);
subplot(1,3,2);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Função ajustada para forma linear');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados'); 

%Solução utilizando Splines Cúbicas

%fprintf('Resoluções para Splines Cúbicas\n\n');
p = spline(x,y);
intervalo = linspace(0,10);
r = ppval(intervalo, p);
subplot(1,3,3);
plot(intervalo, r, 'black', x, y, '+ red');
title('Função ajustada pela Spline');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Função Interpolada','Dados Coletados') 






