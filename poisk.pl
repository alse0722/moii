% exapmle 1

% rests("Sasha", "Antalia").
% rests("Anna", "Sochi").
% rests("Misha", "Urmala").
% rests("Kolya", "Rome").
% italy("Rome").
% russia("Sochi").
% pribaltic("Urmala").

% russian_rests(X) :- rests(X, Y), russia(Y).
% trace.
% russian_rests(X).

% example 2
% class("Kolya", 7).
% class("Misha", 9).
% class("Tolya", 7).
% class("Vanya", 7).
% class("Masha", 9).
% class("Tanya", 7).

% students_in_class(X) :- class(Y, X), write(Y), nl, fail.

% example 3
% grades(Z, "Incorrect input!" ) :- Z < 0, !.
% grades(Z, "Incorrect input!" ) :- Z > 100, !.
% grades(Z, "5")                 :- Z >= 80, !.
% grades(Z, "4")                 :- Z >= 60, !.
% grades(Z, "3")                 :- Z >= 40, !.
% grades(Z, "2").

% all tasks
likes("Misha", guitar).
likes("Masha", arpha).
likes("Roma", football).
likes("Tanya", skies).
sport(football).
sport(skies).
musical_instrument(arpha).
musical_instrument(guitar).

% 1 group
sportsman(X) :- likes(X, Y), sport(Y).

% trace, sportsman(X).

% [trace]  ?- sportsman(X).
%    Call: (12) sportsman(_56458) ? creep
%    Call: (13) likes(_56458, _57744) ? creep
%    Exit: (13) likes("Misha", guitar) ? creep
%    Call: (13) sport(guitar) ? creep
%    Fail: (13) sport(guitar) ? creep
%    Redo: (13) likes(_56458, _57744) ? creep
%    Exit: (13) likes("Masha", arpha) ? creep
%    Call: (13) sport(arpha) ? creep
%    Fail: (13) sport(arpha) ? creep
%    Redo: (13) likes(_56458, _57744) ? creep
%    Exit: (13) likes("Roma", football) ? creep
%    Call: (13) sport(football) ? creep
%    Exit: (13) sport(football) ? creep
%    Exit: (12) sportsman("Roma") ? creep
%   X = "Roma" .

% 2 group
musician(X) :- likes(X, Y), musical_instrument(Y).

% trace, musician(X).

% [trace]  ?- musician(X).
%    Call: (12) musician(_77306) ? creep
%    Call: (13) likes(_77306, _78592) ? creep
%    Exit: (13) likes("Misha", guitar) ? creep
%    Call: (13) musical_instrument(guitar) ? creep
%    Exit: (13) musical_instrument(guitar) ? creep
%    Exit: (12) musician("Misha") ? creep
%   X = "Misha" .

% number 2

rests(name1, city1).
rests(name2, city2).
rests(name3, city3).
rests(name4, city4).
italy(city1).
italy(city2).
russia(city3).
russia(city4).
male(name1).
male(name2).
female(name3).
female(name4).

women_rests_in_russia(X) :- female(X), rests(X, Y), russia(Y).
men_rests_in_italy(X)    :- male(X), rests(X, Y), italy(Y).

% number 3
book(author1, name1, izdatel4, 1990).
book(author1, name2, izdatel1, 2010).
book(author2, name3, izdatel1, 2012).
book(author2, name4, izdatel1, 2005).
book(author3, name1, izdatel2, 2005).
book(author3, name5, izdatel2, 1990).
book(author4, name2, izdatel3, 1990).

all_books(A, S, D, F)   :- book(A, S, D, F), write(A+S+D+F), nl, fail.
two_authors :- all_books(author1, _, _, _), !.
two_authors :- all_books(author2, _, _, _).
izd_n_year  :- book(A, S, D, F), D=izdatel1, F>=2010, write(A+S+D+F), nl, fail.

% number 4
flight(number1, to1, 1730, daily).
flight(number2, to2, 1630, even).
flight(number3, to1, 1800, daily).
flight(number4, to1, 1920, uneven).
flight(number5, to2, 1450, even).
flight(number6, to2, 1750, uneven).
flight(number7, to1, 1720, daily).
flight(number8, to2, 1620, even).
flight(number9, to1, 1810, daily).
flight(number10, to1, 1910, uneven).
flight(number11, to2, 1440, even).
flight(number12, to2, 1730, uneven).

all_flights(A, S, D, F)   :- flight(A, S, D, F), write(A+S+D+F), nl, fail.
to_even :- all_flights(_, to2, _, even).
daily_before_time :- flight(A, S, D, F), F=daily, D<1750, write(A+S+D+F), nl, fail.

% number 5
country(name1, capital1, 1422346, asia).
country(name2, capital2, 124442, asia).
country(name3, capital3, 436454, europe).
country(name4, capital4, 349832, europe).
country(name5, capital5, 349845, asia).
country(name6, capital6, 234094, europe).
country(name7, capital7, 646872, europe).
country(name8, capital8, 1988746, asia).
country(name9, capital9, 9238587, asia).

all_countries(A, S, D, F)   :- country(A, S, D, F), write(A+S+D+F), nl, fail.
has_more_people_than(X) :- country(A, S, D, F), D>=X, write(A+S+D+F), nl, fail.
european_less_people_than(X) :- country(A, S, D, F), D=<X, F=europe,  all_countries(A, S, D, F).

% number 6
word_translate(english, russian).
word_translate(russian, english).

word_dictionary(apple, [яблоко], [apple]).
word_dictionary(book, [книга], [book]).
word_dictionary(table, [стол], [table]).
word_dictionary(pen, [ручка], [pen, ballpoint]).

print_word_word_dictionary :-
    write('Словарь:\n'),
    forall(word_dictionary(Word, Russian, English),
           (write(Word), write(': '),
            write_translations(Russian, 'русский'),
            write_translations(English, 'английский'), nl)).

translate(Word, SourceLanguage, TargetLanguage) :-
    word_dictionary(Word, Russian, English),
    word_translate(SourceLanguage, TargetLanguage),
    member(Translation, Russian),
    member(Translation, English),
    format('~w на ~w: ~w\n', [Word, TargetLanguage, Translation]).

write_translations([], _).
write_translations([H|T], Language) :-
    format('~w', [H]),
    (   T == [] -> write('')
    ;   write(', '), write_translations(T, Language)
    ).

% number 7
abonent('John Doe', '123-456-789').
abonent('Alice Smith', '987-654-321').
abonent('Bob Johnson', '555-123-456').

print_phonebook :-
    write('Телефонный справочник:\n'),
    forall(abonent(Name, Phone),
           (write(Name), write(': '), write(Phone), nl)).

find_phone(Name, Phone) :-
    abonent(Name, Phone).

find_name(Phone, Name) :-
    abonent(Name, Phone).

% number 8
student(alex, 5).
student(irene, 5).
student(ivan, 6).
student(sasha, 7).
student(olga, 6).

loves(alex, games).
loves(alex, coding).
loves(alex, films).
loves(irene, films).
loves(irene, books).
loves(ivan, games).
loves(ivan, chess).
loves(sasha, games).
loves(sasha, books).
loves(olga, chess).
loves(olga, films).

print_lovings :-
    write('Увлечения:\n'),
    forall(student(Name, _),
        (write(Name), write(' - '),
        forall(loves(Name, Smth),
            (write(Smth), write(' '))),
        nl)
    ).

find_lovings_pair :-
    student(Name, Class), loves(Name, films),
    forall((student(Name2, Class2), loves(Name2, films), Name \== Name2, Class \== Class2),
           (write(Name), write(' увлекается тем же что и '), write(Name2), nl)).

% number 9
plays(alex, badmington).
plays(alex, hockey).
plays(alex, videogames).
plays(irene, videogames).
plays(irene, skiing).
plays(ivan, chess).
plays(ivan, skiing).
plays(sasha, badmington).
plays(sasha, chess).
plays(olga, badmington).
plays(olga, skiing).

print_plays :-
    write('Увлечения:\n'),
    forall(student(Name, _),
        (write(Name), write(' - '),
        forall(plays(Name, Smth),
            (write(Smth), write(' '))),
        nl)
    ).

find_plays_pair :-
    student(Name, Class), plays(Name, badmington),
    forall((student(Name2, Class2), plays(Name2, badmington), Name \== Name2, Class \== Class2),
           (write(Name), write(' играет в то же что и '), write(Name2), nl)).
