% Навчання та моделюванн радіально базисної мережі

P = -1: 0.1 :1; % Масив векторів входів
T = [-.9602 -.5770 -.0729 .3771 .6405 .6600 .4609 .1336 ...
-.2013 -.4344 -.5000 -.3930 -.1647 .0988 .3072 .3960 ...
.3449 .1816 -.0312 -.2189 -.3201]; % Масив векторів цілей
plot(P,T,'*r','MarkerSize',4,'LineWidth',2)
hold on

% Створення мережі
net = newrbe(P,T); % Створення радіально базисної мережі

net.layers{1}.size % Число нейронів у прихованому прошарку

% Моделювання мережі
V = sim (net, P); % Вектори входу з навчальної множини
plot(P,V,'ob','MarkerSize',5, 'LineWidth',2)
p = [-0.75 -0.250 .250 .75];
v = sim (net, p); % Новий вектор входу
plot(p,v,'+k','MarkerSize',10, 'LineWidth',2)


