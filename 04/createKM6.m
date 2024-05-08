clear

% Створення карти Кохонена
net = newsom([0 2; 0 1], [2 3]);
net.layers{1}

P = [0.1 0.3 1.2 1.1 1.8 1.7 0.1 0.3 1.2 1.1 1.8 1.7; ...
    0.2 0.1 0.3 0.1 0.3 0.2 1.8 1.8 1.9 1.9 1.7 1.8];

plotsom(net.iw{1,1},net.layers{1}.distances)
hold on
plot(P(1,:),P(2,:),'*k','markersize',10)