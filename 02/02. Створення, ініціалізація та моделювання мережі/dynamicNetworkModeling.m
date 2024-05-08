%{

% Створення одношарової лінійної мережі з лінією затримки [0 1]
net = newlin([-1 1], 1, [0 1]);
net.IW{1,1} = [1 2]; % Присвоєння значень ваг
net.biasConnect = 0; % Присвоєння значень зміщень
P = {-1 -1/2 1/2 1};
A = sim(net,P); % Моделювання мережі net із вхідним сигналом P та виходом A
fprintf('A = ');
for i = 1:length(A)
    fprintf('[%g] ', A{i});
end
fprintf('\n');

%}

%{

% Створення одношарової лінійної мережі з лінією затримки [0 1]
net = newlin([-1 1], 1, [0 1]);
net.IW{1,1} = [1 2]; % Присвоєння значень ваг
net.biasConnect = 0; % Присвоєння значень зміщень
P = [-1 -1/2 1/2 1];
A = sim(net,P); % Моделювання мережі net із вхідним сигналом P та виходом A
fprintf('A = ');
disp(A);

%}

% Створення одношарової лінійної мережі з лінією затримки [0 1]
net = newlin([-1 1], 1, [0 1]);
net.IW{1,1} = [1 2]; % Присвоєння значень ваг
net.biasConnect = 0; % Присвоєння значень зміщень
P = {[-1 1] [-1/2 1/2] [1/2 -1/2] [1 -1]};
A = sim(net,P); % Моделювання мережі net із вхідним сигналом P та виходом A
fprintf('A = ');
disp(A);


