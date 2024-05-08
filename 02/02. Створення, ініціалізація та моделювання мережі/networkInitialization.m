net = newff([-1 2; 0 5],[3,1],{'tansig','purelin'},'traingd');
net = init (net);
net.layers{1}.initFcn = 'initwb';
net.inputWeights{1,1}.initFcn = 'rands';
net.biases{1,1}.initFcn = 'rands';
net.biases{2,1}.initFcn = 'rands';
net = init (net);

%{
% Створення мережі
net = feedforwardnet([3, 1], 'traingd');

% Ініціалізація ваг та зміщень
net = init(net);
net.layers{1}.initFcn = 'initwb';
net.inputWeights{1, 1}.initFcn = 'rands';
net.biases{1}.initFcn = 'rands';
net.biases{2}.initFcn = 'rands';

% Ініціалізація мережі
net = init(net);
%}
