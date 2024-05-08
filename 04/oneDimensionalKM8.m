clear
% 100 двоелементних вхідних векторів одиничної довжини, 
% рівномірно розподілених в межах від 0 до 90°
angles = 0:0.5*pi/99:0.5*pi;
P = [sin(angles); cos(angles)];
plot(P(1,1:10:end), P(2,1:10:end),'*b'), hold on

% Сформуємо саморганізаційну картку Кохонена у вигляді одномірного прошарку 
% з 10 нейронів і виконаємо навчання протягом 2000 циклів
net = newsom([0 1; 0 1], [10]);
net.trainParam.epochs = 2000;
net.trainParam.show = 100;
[net, tr] = train (net, P);
plotsom(net.IW{1,1},net.layers{1}.distances) % Рис.13,а
figure(2)

% Моделювання мережі на масиві навчальних векторів входу
a = sim (net, P);
bar(sum(a')) % Рис. 13,б

a = sim (net, [1; 0])