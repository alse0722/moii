% example 1
% genl(0,[]):-!.
% genl(N,[N|L]):-N1 is N-1, genl(N1,L).

% ?- genl(7, X).
% X = [7, 6, 5, 4, 3, 2, 1].

% example 2
% genl(N2,N2,[]) :- !.
% genl(N1,N2,[N1|L]) :- 
%   N1<N2,
%   N is N1 + 4,
%   genl(N,N2,L).

% goal(N,L):- 
%   K is 4 * (N + 1) - 2,
%   genl(2, K, L).

% example 3
% genl1(N2,N2,[]):-!.
% genl1(N1,N2,[N1|L]):-N1<N2,N is N1+1, genl1(N,N2,L).

% len(0,[]).
% len(X,[_|L]):-len(X1,L), X is X1+1.

% genl1(4,21,L ),len(X, L).

% example 4
% member(X,[X|_]):-write("yes\n"),!.
% member(X,[]):-write("no\n"),!.

% member(X,[_|L]) :- member(X, L).

% --------------------------------------------------------------
% 1_1. 
remove_day(_, [], []).
remove_day(Day, [Day|T], Result) :-
    remove_day(Day, T, Result).
remove_day(Day, [H|T], [H|Result]) :-
    dif(H, Day),
    remove_day(Day, T, Result), !.

% 1_2
insert_element([], NewElement, [[NewElement]]).
insert_element([Head|Tail], NewElement, [[NewElement, Head|Tail]|Rest]) :-
    insert_element(Tail, NewElement, Rest0),
    append([Head], Rest0, Rest).
    
insert_element([Head|Tail], NewElement, [[Head|InsertedTail]|Rest]) :-
    insert_element(Tail, NewElement, Rest),
    append([Head], InsertedTail, Rest).

all_insertions(InputList, NewElement, AllInsertions) :-
    insert_element(InputList, NewElement, AllInsertions).

% 1_3
sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, RestSum),
    Sum is H + RestSum.

% 1_4
remove_element(_, [], []).
remove_element(X, [X|T], Result) :-
    remove_element(X, T, Result).
remove_element(X, [H|T], [H|Result]) :-
    dif(H, X),
    remove_element(X, T, Result).

generate_list(N, List) :-
    numlist(1, N, TempList),
    maplist(multiply_by_two, TempList, List).

multiply_by_two(X, Y) :-
    Y is X * 2.

% 1_5
generate_odd(List) :-
    numlist(1, 9, TempList),
    include(odd, TempList, List).

generate_even(List) :-
    numlist(2, 10, TempList),
    include(even, TempList, List).

odd(X) :- X mod 2 =:= 1.
even(X) :- X mod 2 =:= 0.

merge_lists(List1, List2, Merged) :-
    append(List1, List2, Merged).

% 1_6
generate_list_x3(N, List) :-
    numlist(1, N, TempList),
    maplist(multiply_by_three, TempList, List).

multiply_by_three(X, Y) :-
    Y is X * 3.

% 1_7
generate_list_10_plus_5(N, List) :-
    NumStart is 10,
    helper_10_plus_5(N, NumStart, List).

helper_10_plus_5(0, _, []).
helper_10_plus_5(N, NumStart, [NumStart|Tail]) :-
    N > 0,
    NextNumStart is NumStart + 5,
    NextN is N - 1,
    helper_10_plus_5(NextN, NextNumStart, Tail).

% 1_8
generate_mod_3(List) :-
    numlist(1, 9, TempList),
    include(mod_3, TempList, List).

mod_3(X) :- X mod 3 =:= 0.

% 1_9
generate_minus_1(X, Y, []) :- X =< Y.
generate_minus_1(X, Y, [X|T]) :-
  X > Y,
  PrevX is X - 1,
  generate_minus_1(PrevX, Y, T).

% 1_10
generate_odd_minus_2(X, Y, []) :- X =< Y.
generate_odd_minus_2(X, Y, [X|T]) :-
  X > Y,
  PrevX is X - 2,
  generate_odd_minus_2(PrevX, Y, T).

mult([], 1).
mult([Head|Tail], Product) :-
    mult(Tail, RestProduct),
    Product is Head * RestProduct.

% 1_11
generate_list(N, Start, List) :-
    findall(X, (between(Start, Start+N-1, X)), List).
    
% sum_list([], 0).
% sum_list([Head|Tail], Sum) :-
%     sum_list(Tail, RestSum),
%     Sum is Head + RestSum.

% 2_1
max_list([X], X).
max_list([H|T], Max) :-
    max_list(T, Max1),
    (H > Max1 -> Max = H ; Max = Max1).

% 2_2
count_elements([], 0).
count_elements([_|T], Count) :-
    count_elements(T, RestCount),
    Count is RestCount + 1.

% 2_3
mult_list([], 1).
mult_list([H|T], Product) :-
    mult_list(T, RestProduct),
    Product is H * RestProduct.

% 2_4
exclude_negatives([], []).
exclude_negatives([H|T], [H|Result]) :-
    H >= 0,
    exclude_negatives(T, Result).
exclude_negatives([_|T], Result) :-
    exclude_negatives(T, Result).

% 2_5
bubble_sort(List, Sorted) :-
    swap_pass(List, NewList),
    bubble_sort(NewList, Sorted).
bubble_sort(Sorted, Sorted) :-
    \+ swap_pass(Sorted, _).

swap_pass([X,Y|T], [Y,X|T]) :- X > Y.
swap_pass([X|T], [X|NewT]) :- swap_pass(T, NewT).
swap_pass([], []).

% 2_6
union([], List, List).
union([Head|Tail], List, Result) :-
    member(Head, List),
    !,
    union(Tail, List, Result).
union([Head|Tail], List, [Head|Result]) :-
    union(Tail, List, Result).

% 2_7
reverse_list([], []).
reverse_list([Head|Tail], Reversed) :-
    reverse_list(Tail, RestReversed),
    append(RestReversed, [Head], Reversed).

% 2_8
translate([], []).
translate([0|T], ['ноль'|T1]) :-
    translate(T, T1).
translate([1|T], ['один'|T1]) :-
    translate(T, T1).
translate([2|T], ['два'|T1]) :-
    translate(T, T1).
translate([3|T], ['три'|T1]) :-
    translate(T, T1).
translate([4|T], ['четыре'|T1]) :-
    translate(T, T1).
translate([5|T], ['пять'|T1]) :-
    translate(T, T1).
translate([6|T], ['шесть'|T1]) :-
    translate(T, T1).
translate([7|T], ['семь'|T1]) :-
    translate(T, T1).
translate([8|T], ['восемь'|T1]) :-
    translate(T, T1).
translate([9|T], ['девять'|T1]) :-
    translate(T, T1).

% 2_9
split_list([], [], []).
split_list([X], [X], []).
split_list([X,Y|T], [X|T1], [Y|T2]) :-
    split_list(T, T1, T2).

% 2_10
intersection([], _, []).
intersection([Head|Tail], List2, [Head|Result]) :-
    member(Head, List2),
    !,
    intersection(Tail, List2, Result).
intersection([_|Tail], List2, Result) :-
    intersection(Tail, List2, Result).

% 2_11
difference([], _, []).
difference([Head|Tail], List2, [Head|Result]) :-
    \+ member(Head, List2),
    difference(Tail, List2, Result).
difference([_|Tail], List2, Result) :-
    difference(Tail, List2, Result).

% 2_12
element_mult([], [], []).
element_mult([H1|T1], [H2|T2], [Result|T3]) :-
    Result is H1 * H2,
    element_mult(T1, T2, T3).
