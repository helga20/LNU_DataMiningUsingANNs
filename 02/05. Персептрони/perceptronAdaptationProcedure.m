%{
net = newp([-2 2; -2 2],1);

p = {[2; 2]};
t = {0};

net.adaptParam.passes = 1;
[net, a, e] = adapt (net, p, t);
twts = net.IW {1,1}
tbiase = net.b {1}
%}

net = newp([-2 2; -2 2],1);

net.trainParam.passes = 1;
p = {[2;2] [1;-2] [-2;2] [-1;1]};
t = {0 1 0 1};

[net, a, e] = adapt (net, p, t)

a

e

% Скориговані векторні ваги і зміщення
twts = net.IW {1,1}
tbiase = net.b {1}

a1 = sim (net, p)

disp("*******************************************");

% Виконаємо ще 1 цикл налаштування
[net, a, e] = adapt (net, p, t);
a
e
twts = net.IW {1,1}
tbiase = net.b {1}
a1 = sim (net, p)

