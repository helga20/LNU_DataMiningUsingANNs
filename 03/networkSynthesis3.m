% Моделювання мережі для діапазону значень аргументу, 
% щоб побачити всю апроксимуючу криву.

% Задамо інтервал аргументу в діапазоні [–1 10]:
P2 = -1: 0.1: 10;
A2 = sim (net, P2);
plot(P2,A2,'-k','linewidth',2)
hold on,
plot(P,T,'*k','markersize',10)

