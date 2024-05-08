clear

P = [0 0;1 1;0 3;1 4;3 1;4 1;4 3]'; % Множина векторів входу
Tc = [1 1 2 2 3 3 3]; % Вектор індексів класів

T = ind2vec(Tc) % Матриця зв'язності T у вигляді розрідженої матриці

T = full (T) % Повна матриця

net = newpnn(P,T);
net.layers{1}.size % Число нейронів у мережі PNN

Y = sim (net, P);
Yc = vec2ind(Y) % Перетворення матриці зв'язності на індексний вектор

% Класифікаця деякого набору довільних векторів р, 
% що не належать навчальній множині, використовуючи раніше створену мережу PNN
p = [1 3; 0 1; 5 2]';
% Виконуючи моделювання мережі для цього набору векторів, отримуємо
a = sim (net, p);
ac = vec2ind(a)

clf reset, drawnow
p1 = 0:0.05:5;
p2 = p1;
[P1, P2] = meshgrid (p1, p2);
pp = [P1(:) P2(:)];
aa = sim (net, pp');
aa = full (aa);
m = mesh(P1,P2,reshape(aa(1,:),length(p1),length(p2)));
set(m,'facecolor',[0.75 0.75 0.75],'linestyle','none');
hold on
view(3)
m = mesh(P1,P2,reshape(aa(2,:),length(p1),length(p2)));
set(m,'facecolor',[0 1 0.5],'linestyle','none');,
m = mesh(P1,P2,reshape(aa(3,:),length(p1),length(p2)));
set(m,'facecolor',[0 1 1],'linestyle','none');
plot3(P(1,:),P(2,:),ones(size(P,2))+0.1,'.','markersize',30)
plot3(p(1,:),p(2,:),1.1*ones(size(p,2)),'*','markersize',20,'color',[1 0 0])
hold off
view(2)
