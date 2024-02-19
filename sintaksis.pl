% zadanie 1
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

% zadanie 2
mom(Who, Whom) :- parent(Who, Whom), female(Who).
dad(Who, Whom) :- parent(Who, Whom), male(Who).
son(Who, Whom) :- parent(Whom, Who), male(Who).
dtr(Who, Whom) :- parent(Whom, Who), female(Who).

% zadanie 3
parents(Mom, Dad) :- parent(Mom, Smb), parent(Dad, Smb), Mom\==Dad, female(Mom).
gdad(Who, Whom)   :- parent(Who, Smb), parent(Smb, Whom), male(Who).
gmom(Who, Whom)   :- parent(Who, Smb), parent(Smb, Whom), female(Who).
bro(Who, Whom)    :- son(Who, Smb), dad(Smb, Whom).
niece(Who, Whom)  :- dtr(Who, Smb), bro(Smb, Whom).
