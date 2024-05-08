% Формування одношарової статичної лінійної мережі з двома входами
% і нульовим параметром швидкості налаштування
net = newlin([-1 1;-1 1], 1, 0, 0);
net.IW{1} = [0 0]; % Значення ваг
net.b{1} = 0; % Значення зміщень

P = [-1 -1/3 1/2 1/6; 1 1/4 0 2/3];
T = [-1 -5/12 1 1];

% Параметр швидкості налаштування ваг
net.inputWeights{1,1}.learnParam.lr = 0.2;
net.biases{1}.learnParam.lr = 0; % Параметр швидкості налаштування зсувів
net.trainParam.epochs = 30; % Число циклів навчання

net1 = train(net, P, T);

W = net1.IW {1};
y = sim(net1, P);
EE = mse(y-T);

disp(['W = ', mat2str(W)]);
disp(['y = ', mat2str(y)]);
disp(['EE = ', num2str(EE)]);

