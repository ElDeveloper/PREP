feature('DefaultCharacterSet','UTF8');

colorMap=[...
0.6000 1.0000 0.4000; 1.0000 1.0000 0.6000; 1.0000 0.4000 0.2000; ...
0.3000 0.4000 0.0000; 0.0000 0.4000 1.0000; 0.2000 0.8000 0.4000; ...
1.0000 0.5100 0.4000; 0.1000 0.0000 0.3000; 1.0000 0.5020 0.2000; ...
0.7401 0.7508 1.0000; 0.6667 0.1000 0.3000; 0.4000 0.4000 1.0000; ...
1.0000 0.8000 0.4000; 0.6000 0.2000 0.8000; 0.7333 0.7333 0.7333; ...
1.0000 0.2000 0.6000; 0.4000 0.7333 1.0000; 0.7333 0.5100 0.0000; ...
0.2000 0.5020 0.4000; 1.0000 1.0000 0.0000; 0.4000 0.5100 1.0000; ...
0.6000 0.7500 0.0000; 0.7500 0.1000 0.1500; 1.0000 0.0000 0.0000; ...
0.8000 0.2000 1.0000; 0.0000 1.0000 0.2000; 0.1000 0.0000 0.1000; ...
1.0000 0.5000 0.2000; 0.7500 0.4000 0.6000; 0.4000 0.7333 1.0000; ...
0.8000 0.5800 0.4600; 0.5500 0.7100 0.0000;];

FILENAME = 'participacion_por_estado.txt';

data = importdata(FILENAME);
dist_part = [];
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

for i=1:length(estados)
    buff = data(data(:,1) == i, :);
    pcnt_buff = buff(:, 2)./buff(:, 3);
    pcnt_buff = pcnt_buff(pcnt_buff ~= Inf );

    dist_part = [dist_part; histc(pcnt_buff, 0:0.01:3.5)'];
end

figure;
handle = bar(0:0.01:3.5, dist_part', 'stacked');

grid on;

for i=1:length(estados)
    set(handle(i), 'facecolor', colorMap(i, :));
    set(handle(i), 'EdgeColor', colorMap(i, :));
end

xlim([0 3.5])

legend(estados);

xlabel('Porcentaje de Participantes')
ylabel('Casillas')
title('Porcentaje de Participantes por Casilla por Estado')