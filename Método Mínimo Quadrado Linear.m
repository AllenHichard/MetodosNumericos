% x=randi(100,15,1)
% R = Randi ([10 50], 1,5); aleatorios
%r = rand(10,1);
%r = -5 + (5 + 5) * rand (10,1); intervalo (-5,5). r = a + (b-a).*rand(100,1);
%Xi = [0.1, 0.4, 0.5, 0.7, 0.7, 0.9];
%Yi = [0.61, 0.92, 0.99, 1.52, 1.47, 2.03];
%x = 4.6678;
%x = roundn (x, -2);

Xi = 5 * rand (10,1);
Yi = 5 * rand (10,1);
Xi = sort(roundn(Xi, -2));
Yi = sort(roundn(Yi, -2));
e11 = size(Xi,1); % quantidade de elementos
disp(e11);
e21 = sum(Xi); %somatorio de x
e12= e21;
z1 = sum(Yi); %somatorio de y
e22 = sum(Xi.^2); % somatorio de x elevado ao quadrado
z2 = sum(Xi.*Yi); % somatório de xifi
a = (z1*e22 - z2*e12)/(e22*e11 - e21*e12);
b = (z2*e11 - z1*e21)/(e22*e11 - e21*e12);
%g(x) = a + bx;
polinomio = [b a];
X = linspace(0,5);
Fx = polyval(polinomio, X);
figure(1);
subplot(1,2,1);
plot(X, Fx, 'black', Xi, Yi, '+ red');
%axis ([ xmin xmax ymin ymax ])
axis ([ 0 5 0 5]);
title('Métodos dos Mínimos Quadrados Linear');
xlabel('Eixo X'); ylabel('Eixo Y');
legend('Função Interpolada','Dados Coletados'); 


%g(x) = alpha*e^bx
%Xi = [-1.0, -0.7, -0.4, -0.1, 0.2, 0.5, 0.8, 1.0];
%Yi = [36.547, 17.264, 8.155, 3.852, 1.820, 0.860, 0.406, 0.246];
LnYi = log(Yi);
e11 = size(Xi,1); % quantidade de elementos
e21 = sum(Xi); %somatorio de x
e12= e21;
z1 = sum(LnYi); %somatorio de y
e22 = sum(Xi.^2); % somatorio de x elevado ao quadrado
z2 = sum(Xi.*LnYi); % somatório de xifi
a = (z1*e22 - z2*e12)/(e22*e11 - e21*e12);
b = (z2*e11 - z1*e21)/(e22*e11 - e21*e12);
disp(a);
disp(b);
% a = ln alpha logo alpha = e^a
alpha = exp(a);
disp(alpha);

funcao = @(x)alpha*exp(b*x);
X = linspace(0,5);
Fx = subs(funcao, X);
figure(1);
subplot(1,2,2);
plot(X, Fx, 'black', Xi, Yi, '+ red');
axis ([ 0 5 0 5]);
title('Métodos dos Mínimos Quadrados Linear');
xlabel('Eixo X'); ylabel('Eixo Y');%legend('Função Interpolada','Dados Coletados'); 
