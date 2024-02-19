:- dynamic true/2, false/2.

target:-
  animal(Arg),
  !,
  write("Загаданное animal "),
  writeln(Arg),
  clean.

target:-
  write("К сожалению, is_a animal мне не известно."),
  clean.

animal("Гепард") :- 
  is_a("млекопитающее"),
  is_a("хищник"),
  has_svoistvo("Оно", "красно-коричневого цвета"),
  has_svoistvo("У него", "темная окраска").

% animal("Жираф") :-
%   is_a("травоядное"),
%   has_svoistvo("У него", "длинная шея"),
%   has_svoistvo("У него", "длинные ноги"),
%   has_svoistvo("У него есть", "темные пятна").

animal("Тигр") :-
  is_a("млекопитающее"),
  is_a("хищник"),
  has_svoistvo("Оно", "красно-коричневого цвета"),
  has_svoistvo("У него есть", "черные полосы").

animal("Жираф") :- 
  is_a("травоядное"),
  has_svoistvo("У него", "длинная шея"),
  has_svoistvo("У него", "длинные ноги"),
  has_svoistvo("У него есть", "темные пятна").

animal("Зебра") :-
  is_a("травоядное"),
  has_svoistvo("У него есть", "черные полосы").

animal("Страус") :- 
  is_a("птица"),
  has_not_svoistvo("Оно", "умеет летать"),
  has_svoistvo("У него", "длинная шея"),
  has_svoistvo("У него", "длинные ноги"),
  has_svoistvo("Оно", "черно-белого цвета").

animal("Пингвин") :- 
  is_a("птица"),
  has_not_svoistvo("Оно", "умеет летать"),
  has_svoistvo("Оно", "умеет плавать"),
  has_svoistvo("Оно ", "черно-белого цвета").

animal("Альбатрос") :- 
  is_a("птица"),
  has_svoistvo("Оно", "хорошо летает").

is_a("млекопитающее") :- 
  has_svoistvo("У него есть", "волосы").

is_a("млекопитающее") :-
  has_svoistvo("Оно", "дает молоко").

is_a("птица") :- 
  has_svoistvo("У него есть", "перья").

is_a("птица") :- 
  has_svoistvo("Оно", "умеет летать"),
  has_svoistvo("Оно", "откладывает яйца ").

is_a("хищник") :-
  has_svoistvo("Оно", "ест мясо").

is_a("хищник") :-
  has_svoistvo("У него", "острые зубы"),
  has_svoistvo("У него есть", "когти"),
  has_svoistvo("У него есть", "зоркие глаза").

is_a("травоядное") :- 
  is_a("млекопитающее"),
  has_svoistvo("У него есть", "копыта").

is_a("травоядное") :- 
  is_a("млекопитающее"),
  has_svoistvo("Оно", "жует жвачку").

has_svoistvo(Arg, Arg2) :- 
  true(Arg, Arg2), !.

has_svoistvo(Arg, Arg2) :-
  not(false(Arg, Arg2)), 
  find_out(Arg, Arg2, Resp), Resp=y.

has_not_svoistvo(Arg, Arg2) :-
  false(Arg, Arg2), !.

has_not_svoistvo(Arg, Arg2) :- 
  not(true(Arg, Arg2)), 
  find_out(Arg, Arg2, Resp), Resp=n.

find_out(Arg, Arg2, Resp) :-
  write(Arg),
  write(" "),
  write(Arg2), 
  read(Resp),
  remember(Arg, Arg2, Resp).

remember(Arg, Arg2, y) :- 
  assert(true(Arg,Arg2)).

remember(Arg, Arg2, n) :-
  assert(false(Arg,Arg2)).

clean:-
  retract(true(_,_)),
  fail.
  
clean:-
  retract(false(_,_)),
  fail.

