%   Fatos: Progenitores (pai_ou_mae, filho)
progenitor(urano, cronos).
progenitor(gaia, cronos).
progenitor(urano, oceano).
progenitor(gaia, oceano).
progenitor(cronos, zeus).
progenitor(reia, zeus).
progenitor(cronos, poseidon).
progenitor(reia, poseidon).
progenitor(cronos, hades).
progenitor(reia, hades).
progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).
progenitor(zeus, artemis).
progenitor(leto, artemis).
progenitor(zeus, ares).
progenitor(hera, ares).
progenitor(zeus, hefesto).
progenitor(hera, hefesto).
progenitor(poseidon, tritao).

% Herói, filho de um deus
progenitor(zeus, perseu).
progenitor(danae, perseu).
progenitor(atena, erictonio).

%   Fatos: Poderes e Domínios
dominio(zeus, ceu).
dominio(zeus, trovao).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).
dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).
dominio(ares, guerra_brutal).
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, caca).
dominio(artemis, lua).
dominio(hefesto, fogo).
dominio(hefesto, forja).
dominio(afrodite, beleza).
dominio(afrodite, amor).
dominio(cronos, tempo).

%   Fatos: Armas e Artefatos

arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

%   Fatos: Características e Títulos

caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

%   Fatos: Relações de Aliança (simétricas)

aliado(zeus, poseidon).
aliado(poseidon, zeus).
aliado(atena, apolo).
aliado(apolo, atena).
aliado(ares, hades).
aliado(hades, ares).
aliado(hefesto, atena).
aliado(atena, hefesto).

%   Fatos: Localizações

local_principal(zeus, olimpo).
local_principal(poseidon, atlantida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% Regra: Divindade Olimpica

divindade_olimpica(Deus) :-
    progenitor(cronos, Deus) ,
    dominio(Deus, Dom),
    (Dom = ceu ; Dom = mar ; Dom = submundo).

% Regra: Deus maior
deus_maior(Deus) :-
    local_principal(Deus, olimpo),
    setof(Dom, dominio(Deus, Dom), ListaDominios),
    length(ListaDominios, N),
    N >= 2.

% Regra: Irmãos Germanos
irmaos_germanos(A, B) :-
    progenitor(P1, A),  % primeiro progenitor de A
    progenitor(P1, B),  % mesmo progenitor em B
    progenitor(P2, A),  % segundo progenitor de A
    progenitor(P2, B),  % mesmo progenitor em B
    P1 \= P2,           % precisa ser pai e mãe diferentes
    A \= B.   

% Regra: Ancestral
ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).

% query pro ex1: ?- divindade_olimpica(Quem).
% query pro ex2: ?- deus_maior(Quem).
% query pro ex3: ?- irmaos_germanos(zeus, Quem).
% query pro ex4: ?- ancestral(urano, Quem).