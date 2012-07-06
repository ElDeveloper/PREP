FILENAME = 'excede_por_estado.txt';

data = importdata(FILENAME);
estados = {};
partidos = {};

estados_fp = fopen('estados_abreviados_ganador.txt', 'r');
buff_string = fgets(estados_fp);
while buff_string ~= -1
    buff = regexp(buff_string, '**', 'split');

    estados = {estados{:}, char(buff(1))};
    partidos = {partidos{:}, char(buff(2))};

    buff_string = fgets(estados_fp);
end
fclose(estados_fp);

dist_excesos = hist(data, 1:length(estados));
data_pp = zeros(3, length(estados));

for i=1:1:length(partidos)
    switch char(partidos{i})
        case 'PRI'
            data_pp(1, i) = dist_excesos(i);
        case 'PRD'
            data_pp(2, i) = dist_excesos(i);
        case 'PAN'
            data_pp(3, i) = dist_excesos(i);
        otherwise
            %para Quadri jajajaja
            break;
    end
end

figure
handle = bar(1:length(estados), data_pp', 'stacked');
xlim([1-0.5 length(estados)+0.5]);

grid on;

set(gca,'XTick',1:length(estados))
set(gca,'XTickLabel',estados);

legend({'PRI', 'PRD', 'PAN'});

set(handle(1), 'facecolor', 'r');
set(handle(2), 'facecolor', 'y');
set(handle(3), 'facecolor', 'b');

title('Casillas con Exceso de Votos por Estado');
ylabel('Numero de Casillas');