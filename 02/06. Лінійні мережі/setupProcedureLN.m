% Задані вектори з навчальної множин
P = [1 -1.2];
T = [0.5 1];

% Побудуємо лінійну мережу та промоделюємо її
net = newlind(P,T);
Y = sim(net, P);

net.IW {1,1}

net.b

w_range=-1:0.1: 0; b_range=0.5:0.1:1;
ES = errsurf (P, T, w_range, b_range, 'purelin');
contour(w_range, b_range,ES,20)
hold on
plot(-2.2727e-001,7.2727e-001, 'x') 
hold off
