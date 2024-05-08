p = [2 1 -2 -1; 2 -2 2 1];
t = [0 1 0 1];
net = newlin([-2 2; -2 2], 1);

% Ініціалізація лінійної мережі з двома входами та одним виходом
net.trainParam.goal = 0.1;
[net, tr] = train(net, p, t);

weights = net.iw{1,1};
bias = net.b{1};

A = sim(net, p);
err = t - A;

disp("weights:");
disp(weights);
disp("bias:");
disp(bias);
disp("A:");
disp(A);
disp("err:");
disp(err);
