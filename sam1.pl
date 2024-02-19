% number 1
% loves("Tanya", apples).
% loves("Sergei", banana).
% loves("Andrew", apples).
% loves("Sveta", candy).
% loves("Vova", candy).
% loves("Tanya", khalva).
% loves("Sveta", oranges).
% loves("Vova", banana).

% who_loves_bananas(X)          :- loves(X, banana).
% who_loves_khalva_n_apples(X)  :- loves(X, khalva), loves(X, apples).
% what_vova_loves(X)            :- loves("Vova", X).
% what_sveta_n_vova_loves(X)    :- loves("Sveta", X), loves("Vova", X).

% number 2
% plays("Katya", tennis).
% plays("Victor", tennis).
% plays("Victor", hockey).
% plays("Andrew", hockey).
% plays("Oleg", hockey).
% plays("Olga", tennis).
% plays("Katya", chess).
% plays("Oleg", chess).

% what_andrew_plays(X)        :- plays("Andrew", X).
% who_plays_chess(X)          :- plays(X, chess).
% what_olga_n_victor_plays(X) :- plays("Olga", X), plays("Victor", X).
% who_plays_chess_n_hockey(X) :- plays(X, chess), plays(X, hockey).

% number 3
% loves("Tanya", apples).
% loves("Sergei", bananas).
% loves("Andrew", apples).
% loves("Sveta", caramel).
% loves("Vova", caramel).
% loves("Tanya", khalva).
% loves("Sveta", oranges).
% loves("Vova", bananas).
% is_fruit(apples).
% is_fruit(bananas).
% is_fruit(oranges).
% is_candy(caramel).
% is_candy(khalva).

% loves_fruit(X) :- loves(X, Y), is_fruit(Y).
% loves_candy(X) :- loves(X, Y), is_candy(Y).
% loves_tasty(X) :- loves_candy(X), loves_fruit(X).

% number 4
% plays("Katya", tennis).
% plays("Victor", tennis).
% plays("Victor", hockey).
% plays("Andrew", hockey).
% plays("Oleg", hockey).
% plays("Olga", tennis).
% plays("Katya", chess).
% plays("Oleg", chess).
% female("Katya").
% female("Olga").
% male("Victor").
% male("Andrew").
% male("Oleg").

% female_playing_chess(X) :- plays(X, chess), female(X).
% male_playing_hockey(X)  :- plays(X, hockey), male(X).
% tennis_pair(X, Y)       :- plays(X, tennis), plays(Y, tennis), female(X), male(Y).

% number 5
parent("mikhail_f", "aleksei_m").
parent("evdokia_l", "aleksei_m").
parent("maria_i", "feodor_a").
parent("maria_i", "sofia_a").
parent("maria_i", "ioann_a").
parent("aleksei_m", "feodor_a").
parent("aleksei_m", "sofia_a").
parent("aleksei_m", "ioann_a").
parent("aleksei_m", "petr_a").
parent("aleksei_m", "ekaterina_a").
parent("natalia_k", "petr_a").
parent("natalia_k", "ekaterina_a").
parent("petr_a", "anna_p").
parent("petr_a", "elizaveta_p").
parent("ekaterina_a", "anna_p").
parent("ekaterina_a", "elizaveta_p").

male("mikhail_f").
male("aleksei_m").
male("feodor_a").
male("petr_a").
male("ioann_a").
female("evdokia_l").
female("maria_i").
female("sofia_a").
female("ekaterina_a").
female("natalia_k").
female("anna_p").
female("elizaveta_p").

mom(X, Y)     :- parent(X, Y), female(X).
dad(X, Y)     :- parent(X, Y), male(X).
son(X, Y)     :- parent(Y, X), male(X).
dtr(X, Y)     :- parent(Y, X), female(X).
gson(X, Y)    :- son(X, Smb), parent(Y, Smb).
gdtr(X, Y)    :- dtr(X, Smb), parent(Y, Smb).
parents(Y, X) :- parent(Y, Smb), parent(X, Smb), Y\==X, female(Y).
gdad(X)       :- parent(X, Smb), parent(Smb, _), male(X).
gmom(X)       :- parent(X, Smb), parent(Smb, _), female(X).
bro(X, Y)     :- son(X, Smb), dad(Smb, Y), X\==Y.
sis(X, Y)     :- dtr(X, Smb), dad(Smb, Y).
niece(X, Y)   :- dtr(X, Smb), bro(Smb, Y).

who_is_granny(X)          :- gmom(X).
evdokias_grandchildren(X) :- gson(X, "evdokia_l").
ioanns_bros(X)            :- bro(X, "ioann_a").
whos_ioann_bro(X)         :- bro("ioann_a", X).
feodors_sister(X)         :- sis(X, "feodor_a").

