net = newlin([-1 1], 1, [0 1], 0.5);
Pi = {0}; % Початкова умова для елемента затримки
net.IW{1} = [0 0]; % Значення ваг
net.biasConnect = 0; % Значення зміщення
net.trainParam.epochs = 22;

P = {-1/2 1/3 1/5 1/4}; % Вектор входу
T = {-1 1/6 11/15 7/10}; % Вектор ціл

net1 = train(net, P, T, Pi);


W = net1.IW {1};
y = sim(net1, P);
EE = mse([y{:}]-[T{:}]);

disp(['W = ', num2str(W)]);
disp(['y = ', num2str(cell2mat(y))]);
disp(['EE = ', num2str(EE)]);



