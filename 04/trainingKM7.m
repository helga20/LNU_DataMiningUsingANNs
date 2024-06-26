clear

% Навчання карти Кохонена розміру 2х3 з гексагональною сіткою та 
% з метрикою, що визначається відстанню зв'язку

% Створення карти Кохонена
net = newsom([0 2; 0 1], [2 3]);

% 12 двоелементних векторів входу
P = [0.1 0.3 1.2 1.1 1.8 1.7 0.1 0.3 1.2 1.1 1.8 1.7; ...
    0.2 0.1 0.3 0.1 0.3 0.2 1.8 1.8 1.9 1.9 1.7 1.8];

% Кількість циклів навчання
net.trainParam.epochs = 2000; 

net.trainParam.show = 100;
net = train (net, P);
plot(P(1,:),P(2,:),'*','markersize',10)
hold on
plotsom(net.iw{1,1},net.layers{1}.distances)

% Масив вагових векторів
net.IW{1}

% Моделювання мережі на масиві навчальних векторів входу
a = sim (net, P)

% Якщо сформувати довільний вектор входу, 
% то карта Кохонена має вказати його належність до того чи іншого кластера
a = sim (net, [1.5; 1])

