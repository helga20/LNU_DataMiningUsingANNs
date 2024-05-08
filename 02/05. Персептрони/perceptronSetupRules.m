%{
net = newp([-2 2; -2 2],1);

net.b{1} = 0;
w = [1 -0.8];
net.IW{1,1} = w;

p = [1; 2];
t = [1];

a = sim (net, p)
e = t-a

dw = learnp(w,p,[ ],[ ],[ ],[ ],e,[ ],[ ],[ ])
w = w + dw
%}

net = newp([-2 2; -2 2], 1);
net.b{1} = 0;
w = [1 -0.8];
net.IW{1,1} = w;

p = [1; 2];
t = [1];

% Моделювання мережі
a = sim(net, p);

% Помилка
e = t - a;

% Оновити ваги вручну
learning_rate = 0.1;  
dw = learning_rate * e * p';
w = w + dw;

% Оновити ваги в мережі
net.IW{1,1} = w;

% Відобразити оновлені ваги
disp("Оновлені ваги:");
disp(w);
