% number 1
calc_1(X, Y) :- X =\= 2, Y is (X * X + 1)/(X - 2).
calc_1(2, undefined).

% number 2
calc_2(X, Y, S) :- X =\= (-Y), S is 2 * (X * X + Y * Y)/(X + Y).
calc_2(_, _, undefined).

% number 3
calc_3(X, Y, S) :- S is (X + Y) / 2.

% number 4
calc_4(X, Result) :-
  ( number(X),
    X >= 0,
    integer(X)
  ->  ( X mod 2 =:= 0
      ->  Result = 'Число четное'
      ;   Result = 'Число не четное'
      )
  ;   Result = 'Число не натуральное'
  ).

% number 5
calc_5(X, A, B, S) :-
  ( X < A
    ->  S = 'Не попадает'
    ; ( X > B
        -> S = 'Не попадает'
        ;  S = 'Попадает'
      )
  ).

% number 6
calc_6(X, Y, Z, S) :-
  (
    X < Y
    ->  (  X < Z
        -> S = X
        ;  S = Z
        )
    ;   (  Y < Z
        -> S = Y
        ;  S = Z
        )
  ).

% number 7
calc_7(X, Y, Z, S) :-
  (
    X < Y
    ->  (  Y < Z
        -> S = Z
        ;  S = Y
        )
    ;   (  X < Z
        -> S = Z
        ;  S = X
        )
  ).