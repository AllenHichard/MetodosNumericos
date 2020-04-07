%Allen Hichard Marques dos Santos
%Rodrigo Brito Santos
%Engenharia de computa��o - M�todos num�ricos

%Solu��o para Sistema de Equa��o Lineares
%Equa��es utilizadas
%2x + 5y - 3z = 6 
%3x + 2y + 3z = 2 
%1x + 3y + 2z = 4
A = [2 5 -3; 3 2 3; 1 3 2]; %Coeficientes das equa��es
B = [6;2;4]; %Vetor resultado de cada equa��o

fprintf('Resolu��es para sistemas de equa��es lineares\n\n');
fprintf('Solu��o pela opera��o inv\n\n');
X = inv(A)*B;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solu��o pela operador "barra invertida" \n\n');
X = A\B;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solu��o pela Decomposi��o LU\n\n');
[L,U] = lu(A);
Y = L\B;
X = U\Y;
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

fprintf('Solu��o Linsolve usando decomposi��o LU com pivotamento\n\n');
X = linsolve(A,B);
fprintf('X = %f \nY = %f\nZ = %f\n\n', X(1), X(2), X(3));

%O arquivo Bio enviado serve para utilizar esse m�todo intervalar.
%fprintf('Solu��o usando fsolve');
%mais eficiente
%vamos re-escrever as equa��es tornando o lado direito igual a zero:
%0.2x + 0.5y = 1
%0.3x + 0.2y = 0.6
%A = 0.2x + 0.5y � 1 = 0
%0.3x + 0.2y - 0.6 = 0
%options = optimset('Display','iter');
%s = fsolve('bio',[2 0.5],options);
%disp(s);
%Para alterar esse m�todo tem que ir no arquivo bio e mudar as equa��es. 

%Solu��o para Interpola��o Polinomial e m�nimos quadrados

fprintf('Resolu��es para Interpola��o Polinomial\n\n');

%Valores correspondentes de x e y para a interpola��o
fprintf('Valores de x\n\n');
x = [2 4 6 8];
fprintf('%f ', round(x));
fprintf('\nValores de f(x)\n\n');
y = [7 3 10 5];
fprintf('%f ', round(y));
funcao = polyfit(x,y,3); % Fun��o para interpola��o ou m�nimos quadrados
fprintf('\nInterpolando se encontra a fun��o\n\n');
disp(funcao);
intervalo = linspace(0,10);
Fx = polyval(funcao, intervalo);
figure(1);
subplot(1,3,1);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Fun��o ajustada para um grau C�bico');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados') 

% Caso a fun��o necessite de um grau menor, n�o ser� poss�vel interpolar,
% portanto ser� feito um ajuste de curvas por m�nimos quadrados.
fprintf('Resolu��es para Ajuste de Curvas minimos quadrados\n');
funcao = polyfit(x,y,2);
fprintf('Ajustando em um grau quadr�tico se encontra essa fun��o\n');
disp(funcao);
intervalo = linspace(-10,20);
Fx = polyval(funcao, intervalo);
subplot(1,3,2);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Fun��o ajustada para um grau quadr�tico');
xlabel('Eixo X') 
ylabel('Eixo Y')
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados')

%Solu��o utilizando Splines C�bicas

%fprintf('Resolu��es para Splines C�bicas\n\n');
p = spline(x,y);
intervalo = linspace(0,10);
r = ppval(intervalo, p);
subplot(1,3,3);
plot(intervalo, r, 'black', x, y, '+ red');
title('Fun��o ajustada pela Spline');
xlabel('Eixo X') 
ylabel('Eixo Y')
text(2,7, '(2,7)');text(4,3, '(4,3)');text(6,10,'(6,10)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados');

%A gr�fico da Splines foi semelhante ao interpolado, mas de acordo com a
%te�ria os mesmo possuem caracteristicas diferentes e tendem a ser fun��es
%diferentes.


fprintf('Outro Exemplo\n\n');
%Valores correspondentes de x e y para a interpola��o
fprintf('Valores de x\n\n');
x = [2 5 8];
fprintf('%f ', round(x));
fprintf('\nValores de f(x)\n\n');
y = [7 2 5];
fprintf('%f ', round(y));
funcao = polyfit(x,y,2); 
fprintf('\nInterpolando se encontra a fun��o\n\n');
disp(funcao);
intervalo = linspace(0,10);
Fx = polyval(funcao, intervalo);
figure(2);
subplot(1,3,1);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Fun��o ajustada para um grau quadr�tico');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados');

% Caso a fun��o necessite de um grau menor, n�o ser� poss�vel interpolar,
% portanto ser� feito um ajuste de curvas por m�nimos quadrados.
fprintf('Resolu��es para Ajuste de Curvas minimos quadrados\n');
funcao = polyfit(x,y,1);
fprintf('Ajustando em um grau linear se encontra essa fun��o\n');
disp(funcao);
intervalo = linspace(-10,20);
Fx = polyval(funcao, intervalo);
subplot(1,3,2);
plot(intervalo, Fx, 'black', x, y, '+ red');
title('Fun��o ajustada para forma linear');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados'); 

%Solu��o utilizando Splines C�bicas

%fprintf('Resolu��es para Splines C�bicas\n\n');
p = spline(x,y);
intervalo = linspace(0,10);
r = ppval(intervalo, p);
subplot(1,3,3);
plot(intervalo, r, 'black', x, y, '+ red');
title('Fun��o ajustada pela Spline');
xlabel('Eixo X'); ylabel('Eixo Y');
text(2,7, '(2,7)');text(5,2, '(5,2)');text(8,5, '(8,5)');
legend('Fun��o Interpolada','Dados Coletados') 






