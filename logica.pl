% number 1
skameika(Order) :- 
  Order = [_, _, _],
  member(vitya, Order),
  member(yura, Order),
  member(misha, Order),
  sits_left_to(misha, yura, Order),
  sits_left_to(vitya, misha, Order),
  !.

sits_left_to(X, Y, Order)  :- append(_, [X, Y|_], Order).
sits_right_to(X, Y, Order) :- append(_, [Y, X|_], Order).

% number 2
forest(Heights, Max, Min) :-
  Heights = [_, _, _, _, _, _],
  permutation(['Тополь', 'Береза', 'Липа', 'Клен', 'Сосна', 'Ель'], Heights),
  is_bigger('Тополь', 'Береза', Heights),
  is_bigger('Береза', 'Липа', Heights),
  is_bigger('Липа', 'Клен', Heights),
  is_bigger('Сосна', 'Тополь', Heights),
  is_bigger('Ель', 'Сосна', Heights),
  Heights = [Min, _, _, _, _, Max],
  !.

is_bigger(X, Y, Sizes)  :- append(_, [Y, X|_], Sizes).
is_smaller(X, Y, Sizes) :- append(_, [X, Y|_], Sizes).

% number 3
child(lena).
child(petya).
child(tanya).

pet(cat).
pet(dog).
pet(hamster).

pravilo(X, Y) :- child(X), pet(Y), X == petya, Y \== cat, Y \==hamster.
pravilo(X, Y) :- child(X), pet(Y), X == tanya, Y == cat.
pravilo(X, Y) :- child(X), pet(Y), X == lena.

solve(A, B, C, X, Y, Z) :-
  A = lena,
  B = petya,
  C = tanya,
  pravilo(B, Y),
  pravilo(C, Z),
  pravilo(A, X),
  X \== Y, X\== Z, Y\==Z, !.

children :-
  solve(A, B, C, X, Y, Z),
  write(A), write(' has a '), write(X), nl,
  write(B), write(' has a '), write(Y), nl,
  write(C), write(' has a '), write(Z), nl,
  !.

% number 4
bro(belokurov).
bro(rizhov).
bro(chernov).

hair(white).
hair(black).
hair(red).

hair_color(X, Y) :- bro(X), hair(Y), X == belokurov, Y \== white, Y \== black.
hair_color(X, Y) :- bro(X), hair(Y), X == rizhov, Y \== red.
hair_color(X, Y) :- bro(X), hair(Y), X == chernov, Y \== black.

solve2(A, B, C, X, Y, Z) :-
  A = belokurov,
  B = rizhov,
  C = chernov,
  hair_color(B, Y),
  hair_color(C, Z),
  hair_color(A, X),
  X \== Y, X\== Z, Y\==Z, !.

bros :-
  solve2(A, B, C, X, Y, Z),
  write(A), write(' has '), write(X), write(' hair'), nl,
  write(B), write(' has '), write(Y), write(' hair'), nl,
  write(C), write(' has '), write(Z), write(' hair'), nl,
  !.

% number 5
skameika2(Seats) :-
  Seats = [_, _, _, _],
  permutation(['Витя', 'Юра', 'Миша', 'Дима'], Seats),
  right_to('Юра', 'Дима', Seats),
  right_to('Миша', 'Витя', Seats),
  right_to('Витя', 'Юра', Seats),
  !.

left_to(X, Y, Seats)  :- append(_, [X, Y|_], Seats).
right_to(X, Y, Seats) :- append(_, [Y, X|_], Seats).

% number 6
rivers(Sizes, X) :-
  Sizes = [_, _, _, _],
  permutation(['Волга', 'Амударьи', 'Днепр', 'Лена'], Sizes),
  bigger_than('Волга', 'Амударьи', Sizes),
  smaller_than('Днепр', 'Амударьи', Sizes),
  bigger_than('Лена', 'Волга', Sizes),
  Sizes = [_, X, _, _],
  !.

smaller_than(X, Y, Sizes)  :- append(_, [X, Y|_], Sizes).
bigger_than(X, Y, Sizes) :- append(_, [Y, X|_], Sizes).

