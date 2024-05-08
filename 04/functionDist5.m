% Прямокутна сітки з 6 нейронів
% Обчислення відповідного масиву відстаней
pos = gridtop(2,3);
d = dist(pos) % Евклідова відстань

pos = gridtop(2,3);
d = boxdist(pos) % Дає околи квадратиками

pos = gridtop(2,3);
d = linkdist(pos) % Зв’язкова відстань

pos = gridtop(2,3);
d = mandist (pos) % Манхетенська відстань 