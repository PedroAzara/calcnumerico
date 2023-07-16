// Esta função implementa o método de interpolação de diferenças divididas de Newton
function y = newton(X, Y, x)
    // x é o valor do ponto a ser estimado pela interpolação
    // X é o vetor das abscissas
    // Y é o vetor das ordenadas.
    // Calcula o comprimento do vetor X e armazena o resultado na variável n
    n = length(X); // armazena as dimensoes do vetor x
    // Inicializa um vetor D de comprimento n com zeros
    // Este vetor será usado para armazenar as diferenças divididas
    D = zeros(n, 1); // inicialização do vetor de diferenças divididas
    // Usa um loop for para atribuir os valores do vetor Y ao vetor D
    // Isso é feito para inicializar a primeira coluna da tabela de diferenças divididas
    for i = 1:1:n do
        D(i) = Y(i);
    end
    // Usa dois loops for aninhados para calcular as diferenças divididas de ordem superior
    // O loop externo itera sobre a ordem das diferenças divididas
    // O loop interno itera sobre os elementos do vetor D
    // Os valores no vetor D são atualizados usando a fórmula das diferenças divididas
    for k = 1:1:n - 1 do
        for i = n:-1:k + 1 do
            D(i) = (D(i) - D(i - 1)) / (X(i) - X(i - k));
        end
    end
    // Monta o polinômio de interpolação usando as diferenças divididas armazenadas no vetor D
    // Usa um loop for para iterar sobre os elementos do vetor D em ordem decrescente
    // e calcular o valor de y no ponto dado x
    y = D(n);
    for i = n - 1:-1:1 do
        y = y * (x - X(i)) + D(i);
    end
endfunction
// Esta função plota um gráfico da função de interpolação de Newton
function plot_newton(X, Y)
    // Gera um vetor x_plot contendo 100 pontos igualmente espaçados entre o mínimo e máximo de X
    x_plot = linspace(min(X), max(X), 100); // gera 100 pontos entre o máximo de X e o mínimo de X

    // Inicializa um vetor y_plot do mesmo comprimento que o vetor x_plot com zeros
    // Este vetor será usado para armazenar os valores estimados de y
    y_plot = zeros(1, length(x_plot)); // inicializa um vetor para armazenar os pontos

    // Usa um loop for para iterar sobre cada valor no vetor x_plot e chamar a função newton com esse valor
    // para obter um valor estimado de y naquele ponto. Esses valores são armazenados no vetor y_plot.
    for i = 1:length(x_plot)
        y_plot(i) = newton(X, Y, x_plot(i)); // avalia a função de newton em cada ponto 
    end

    // Usa a função plot para plotar os pontos armazenados nos vetores x_plot e y_plot em um gráfico.
    plot(x_plot, y_plot); // plota os pontos
endfunction
