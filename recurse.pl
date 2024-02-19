% number 1
pow(X, N, Y) :-
    integer(X),
    integer(N),
    (   N >= 0 ->
        calc_pow(X, N, 1, Y), !
    ;   calc_neg_pow(X, N, 1, InvX),
        Y is 1 / InvX, !
    ).

calc_pow(_, 0, Acc, Acc).

calc_pow(X, N, Acc, Y) :-
    N > 0,
    NewAcc is Acc * X,
    NewN is N - 1,
    calc_pow(X, NewN, NewAcc, Y).

calc_neg_pow(_, 0, Acc, Acc).

calc_neg_pow(X, N, Acc, InvX) :-
    N < 0,
    NewAcc is Acc * X,
    NewN is N + 1,
    calc_neg_pow(X, NewN, NewAcc, InvX).

% number 2
fib(N, F) :-
    integer(N),
    ( N < 0
      -> F is 'Введено неверное N'
      ; ( N =:= 1
          ->  F is 0, !
          ;   calc_fib(0, 1, 2, N, F), !
        )
    ).

calc_fib(_, F, N, N, F) :- !.

calc_fib(X2, X1, Ncur, N, Res) :-
    N > Ncur,
    X2_new is X1,
    X1_new is X2 + X1,
    Ncur_new is Ncur + 1,
    calc_fib(X2_new, X1_new, Ncur_new, N, Res).

% number 3
hanoi(1, From, To, _) :-
  write('Переместить диск с вершины стержня '), 
  write(From), write(' на стержень '), 
  write(To), nl.

hanoi(N, From, To, Aux) :-
  N > 1,
  M is N - 1,
  hanoi(M, From, Aux, To),
  hanoi(1, From, To, _),
  hanoi(M, Aux, To, From).
