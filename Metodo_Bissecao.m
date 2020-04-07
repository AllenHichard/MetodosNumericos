function Metodo_Bissecao(iteracao, titulo,fun, interMin, interMax)
    syms x;
    maxIteracao = iteracao;
    limiteInferior = interMin; limiteSuperior = interMax;
    qtdInteracao = 1;
    percursoX = [];
    percursoY = [];
    funcao = fun;
    intervalo = [limiteInferior limiteSuperior];
    valorVerdadeiro = fzero(funcao,intervalo);
    coordenadasX = linspace(-30, 30, 100);
    coordenadasy = subs(funcao, x , coordenadasX);
    subplot(2,2,3);
    plot(coordenadasX, coordenadasy, 'red', percursoX, percursoY, '+black');
    title(titulo);
    xlabel('eixo x');
    ylabel('eixo y');
    grid;
    coordenadasX = linspace(limiteInferior, limiteSuperior, 100);
    coordenadasy = subs(funcao, x , coordenadasX);
    pause(1);
    Es = eps; %a margem de erro é de acordo com o eps da máquina atual, na qual está se executando o algoritmo
    anteriorXr = 0;
    fprintf('Iteracao   | A                  | B                  | Xr                 | Erro                 | Erro Verdadeiro\n');
    while (qtdInteracao <= maxIteracao)
        Xr = (limiteInferior+limiteSuperior)/2;
        Ea = abs((Xr - anteriorXr)/ Xr) * 100;
        Ev = abs((valorVerdadeiro - anteriorXr));
        fprintf('%3d        | %.16f | %.16f | %.16f | %.16f | %.16f\n', qtdInteracao,limiteInferior,limiteSuperior,Xr,Ea, Ev);
        fxk = subs(funcao, x , Xr);
        percursoX(qtdInteracao) = Xr; 
        percursoY(qtdInteracao) = fxk;
        subplot(2,2,3);
        plot(coordenadasX, coordenadasy, 'red', percursoX, percursoY, '+black');
        title(titulo);
        xlabel('eixo x');
        ylabel('eixo y');
        grid;
        pause(1);

        if Ea <= Es
            fprintf('Quantidade de Iteracoes e: %d \n',qtdInteracao);
            fprintf('Raiz Aproximada da funcao e: %.16f \n', Xr); 
            break;

        elseif Ev == 0 
            %fprintf('Epslon: %.40f \n',Es);
            %fprintf('Erro: %.40f \n',Ea);
            fprintf('Quantidade de Iteracoes e: %d \n',qtdInteracao);
            fprintf('Raiz Exata da funcao e: %.16f \n', Xr);
            break; 
        end
        qtdInteracao = qtdInteracao + 1;
        fxa =  subs(funcao, x , limiteInferior);
        if(fxa*fxk < 0)
            limiteSuperior = Xr;
        else  
            limiteInferior = Xr;
        end
        anteriorXr = Xr;
    end
    if(maxIteracao > 0)
        subplot(2,2,4);
        plot(coordenadasX, coordenadasy, 'red', Xr,fxk, '+green');
        title('Resultado Metodo Bissecao');
        xlabel('eixo x');
        ylabel('eixo y');
        grid;
        if Ea > Es && Ev ~= 0
            fprintf('Quantidade de Iteracoes e: %d \n',qtdInteracao - 1);
            fprintf('Ultima Raiz calculada: %.16f \n', Xr);
        end
    end

