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

% zadanie 2
petrs_parents :- parent(X, "petr_a").
petrs_children :- parent("petr_a", X).