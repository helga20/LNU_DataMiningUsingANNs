clear
sys = ss(tf(1,[1 1 1])); % Формування коливальної ланки

% Отримання реакції на порогову вхідну дію
time = 0:0.2:10;
[y,time] = step(sys,0:0.2:10);

% Формування навчальної множини
p = y(1: length(time)-2)';
t = y(3: length(time))';
time = time(1:length(time)-2);

% Формування нейронної мережі
net = newlin([-1 1], 1, [1 2]);
P = num2cell(p);
T = num2cell(t);

% Налаштування нейронної мережі
pi = {0 0};
net.adaptParam.passes = 5;
[net, Y, E, Pf, Af] = adapt (net, P, T, pi);
Y1 = cat (1, Y {:}); % Перетворення масиву комірок на масив double

% Побудова графіків
plot(time, Y1, 'b:', time, p, 'r-'), xlabel('Час, с'), ylabel('Процеси')
title('Навчання нейронної мережі')

% Моделювання нейронної мережі
x = sim (net, P);
x1 = cat (1, x {:});
plot(time,x1,'b')
net.IW{1,1}, net.b
