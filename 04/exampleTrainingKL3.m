clear

% Розглянемо 48 випадкових векторів на площині, що формують 8 кластерів, що групуються біля своїх центрів.
c = 8; n = 6; % Число кластерів, векторів у кластері

d = 0.5; % Середньоквадратичне відхилення від центру кластера
x = [-10 10; -5 5]; % Діапазон вхідних значень
% Отримання розмірів матриці x
% Знаходження мін./макс. значень в кожному стовпці x і транспонування їх для отримання вектора-стовпця
[r, q] = size (x); minv = min(x')'; maxv = max(x')'; 
% Створюється матриця v, що містить випадкові вектори, які утворюють кластери навколо своїх центрів.
v = rand (r, c) .* ((maxv - minv) * ones (1, c) + minv * ones(1, c));
t = c * n; % Число точок
v = [v v v v v v]; v=v+randn(r,t)*d; % Координати точок
P = v;
plot(P(1,:), P(2,:),'+k') % Рис.
title(' Вектори входу'), xlabel('P(1,:)'), ylabel('P(2,:)')

% Застосуємо конкуруючу мережу з 8 нейронів для того, щоб розподілити їх за класами
net = newc([-2 12; -1 6], 8, 0.1);
w0 = net.IW{1}
b0 = net.b{1}
c0 = exp(1) ./ b0
 
% Після навчання протягом 500 циклів отримаємо
net.trainParam.epochs = 500;
net = train(net, P);
w = net.IW {1}
bn = net.b {1}
cn = exp(1) ./ bn