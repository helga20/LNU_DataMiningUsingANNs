P = [1 -1.2]; % Вектор входів
T=[0.5, 1]; % Вектор цілей

% Максимальне значення параметра навчання
maxlr = 0.40 * maxlinlr (P, 'bias');

% Створення лінійної мережі
net = newlin([-2,2],1,[0],maxlr);

% Розрахунок функції критерію якості
w_range=-1:0.2:1; b_range=-1:0.2:1; % Діапазони значень ваг та зміщення
ES = errsurf (P, T, w_range, b_range, 'purelin');

% Побудова поверхні функції критерію якості
surfc(w_range, b_range, ES) 


%{

% Розрахунок траєкторії навчання
x = zeros (1,50); y = zeros(1,50);
net.IW{1}=1; net.b {1} = -1; % Початкові значення ваг та зміщення
x(1) = net.IW{1}; y(1) = net.b{1};
net.trainParam.goal = 0.001; % Порогове значення критерію якості
net.trainParam.epochs = 1; % Число епох
% Цикл обчислення ваги та зміщення для однієї епохи
for i =2:50,
    [net, tr] = train (net, P, T);
    x(i) = net.IW{1};
    y(i) = net.b{1};
end
% Побудова ліній рівня та траєкторії навчання
clf, contour(w_range, b_range, ES, 20), hold on
plot(x, y,'-*'), hold off, 

%}

net.IW{1}=1; net.b {1} = -1; % Початкові значення ваг та зміщення
net.trainParam.epochs = 50; % Число епох навчання
net.trainParam.goal = 0.001; % Порогове значення критерію якості
[net, tr] = train (net, P, T);
net.IW, net.b

net.trainParam.goal = 0.00001;
[net, tr] = train (net, P, T);
net.IW, net.b