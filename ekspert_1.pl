:- dynamic true/2, false/2.

target:-
  hero(Arg),
  !,
  write("Загаданное hero "),
  writeln(Arg),
  clean.

target:-
  write("К сожалению, is_a hero мне не известно."),
  clean.

hero("Пудж") :- 
  is_a("сапорт"),
  is_a("силовик"),
  has_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "таргетный ульт"),
  has_not_svoistvo("У него есть", "стан"),
  has_svoistvo("У него", "есть крюк"),
  has_not_svoistvo("У него", "есть пассивка").

hero("Рубик") :-
  is_a("сапорт"),
  is_a("интовик"),
  has_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "таргетный ульт"),
  has_svoistvo("У него есть", "стан"),
  has_svoistvo("У него", "много кнопок"),
  has_svoistvo("Оно", "крадет скилы"),
  has_svoistvo("У него есть", "пассивка").

hero("Фантомка") :-
  is_a("кери"),
  is_a("агильщик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "пассивный ульт"),
  has_not_svoistvo("У него есть", "стан"),
  has_svoistvo("У него", "есть криты"),
  has_svoistvo("У него есть", "пассивка").

hero("Урса") :- 
  is_a("кери"),
  is_a("силовик"),
  has_svoistvo("Оно", "часто пикается"),
  has_not_svoistvo("У него есть", "стан"),
  has_svoistvo("Оно", "сильное в лейте"),
  has_svoistvo("У него есть", "длинные когти"),
  has_svoistvo("У него есть", "пассивка").

hero("Арбуз") :-
  is_a("хардовик"),
  is_a("силовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "массовый ульт"),
  has_not_svoistvo("У него есть", "стан"),
  has_not_svoistvo("Оно", "в мете"),
  has_svoistvo("У него есть", "пассивка"),
  has_svoistvo("У него есть", "якорь").

hero("Кунка") :- 
  is_a("хардовик"),
  is_a("силовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него есть", "стан"),
  has_svoistvo("Оно", "сильное в лейте"),
  has_svoistvo("У него есть", "корабль"),
  has_not_svoistvo("У него есть", "пассивка").

hero("Тинкер") :- 
  is_a("мидер"),
  is_a("интовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_not_svoistvo("У него есть", "стан"),
  has_not_svoistvo("Оно", "сильное в лейте"),
  has_svoistvo("У него есть", "лазер"),
  has_not_svoistvo("У него есть", "пассивка"),
  has_svoistvo("У него", "много кнопок").

hero("Инвокер") :- 
  is_a("мидер"),
  is_a("универсал"),
  has_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него есть", "стан"),
  has_svoistvo("Оно", "сильное в лейте"),
  has_svoistvo("У него", "трясутся руки"),
  has_not_svoistvo("У него есть", "пассивка"),
  has_svoistvo("У него", "много кнопок").

hero("Леон") :-
  is_a("хард сапорт"),
  is_a("интовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "таргетный ульт"),
  has_svoistvo("У него есть", "стан"),
  has_not_svoistvo("У него", "много кнопок"),
  has_not_svoistvo("У него есть", "пассивка").

hero("Винга") :-
  is_a("хард сапорт"),
  is_a("универсал"),
  has_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "таргетный ульт"),
  has_svoistvo("У него есть", "стан"),
  has_not_svoistvo("У него", "много кнопок"),
  has_svoistvo("У него есть", "пассивка"),
  has_svoistvo("Оно", "умеет возрождаться").

hero("Мипо") :-
  is_a("мидер"),
  is_a("универсал"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_not_svoistvo("Оно", "сильное в лейте"),
  has_svoistvo("У него", "есть клоны"),
  has_svoistvo("У него есть", "пассивка"),
  has_svoistvo("У него", "много кнопок").

hero("Шейкер") :-
  is_a("сапорт"),
  is_a("силовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "массовый ульт"),
  has_not_svoistvo("У него есть", "стан"),
  has_svoistvo("У него есть", "пассивка"),
  has_svoistvo("У него есть", "якорь").

hero("Цмка") :-
  is_a("хард сапорт"),
  is_a("интовик"),
  has_not_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "массовый ульт"),
  has_svoistvo("У него есть", "стан"),
  has_svoistvo("У него есть", "пассивка"),
  has_svoistvo("Оно", "крип").

hero("Антимаг") :-
  is_a("кери"),
  is_a("агильщик"),
  has_svoistvo("Оно", "часто пикается"),
  has_svoistvo("У него", "таргетный ульт"),
  has_not_svoistvo("У него есть", "стан"),
  has_svoistvo("Оно", "крип"),
  has_svoistvo("Оно", "ненавидит магов").

is_a("кери") :- 
  has_svoistvo("У него", "должны быть слоты").

is_a("кери") :-
  has_svoistvo("Оно", "дает пизды").

is_a("хардовик") :- 
  has_svoistvo("Оно", "очень плотное").

is_a("хардовик") :- 
  has_svoistvo("У него", "задача умереть").

is_a("хард сапорт") :- 
  has_svoistvo("Оно", "ставит варды"),
  has_svoistvo("Оно", "делает стаки").

is_a("хард сапорт") :- 
  has_svoistvo("У него", "обычно нет слотов").

is_a("сапорт") :-
  has_svoistvo("Оно", "гангает").

is_a("сапорт") :-
  has_svoistvo("Оно", "помогает мидеру").

is_a("мидер") :-
  has_svoistvo("У него", "дождны быть прямые руки"),
  has_svoistvo("У него", "обычно самый большой лвл"),
  has_svoistvo("Оно", "дает сс").

is_a("интовик") :-
  has_svoistvo("У него", "основной атрибут - интеллект").

is_a("агильщик") :-
  has_svoistvo("У него", "основной атрибут - ловкость").

is_a("силовик") :-
  has_svoistvo("У него", "основной атрибут - сила").

is_a("универсал") :-
  has_svoistvo("У него", "нет основного атрибута").

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

