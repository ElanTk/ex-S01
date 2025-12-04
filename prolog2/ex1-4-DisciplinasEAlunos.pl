% Fatos: Disciplinas (nome, créditos, area)
disciplina(programacao1, 6, fundamental).
disciplina(calculo1, 8, matematica).
disciplina(estrutura_dados, 6, computacao).
disciplina(algoritmos, 4, computacao).
disciplina(banco_dados, 6, aplicacoes).
disciplina(redes, 4, aplicacoes).
disciplina(inteligencia_artificial, 8, computacao).
disciplina(compiladores, 6, computacao).
disciplina(teoria_grafos, 4, matematica).
disciplina(estatistica, 6, matematica).
disciplina(sistemas_operacionais, 6, computacao).
disciplina(projeto_integrador, 10, aplicacoes).

% Fatos: Pré-Requisitos (disciplina_principal, pre_requisito)
prerequisito(estrutura_dados, programacao1).
prerequisito(algoritmos, estrutura_dados).
prerequisito(banco_dados, programacao1).
prerequisito(inteligencia_artificial, algoritmos).
prerequisito(inteligencia_artificial, calculo1).
prerequisito(compiladores, algoritmos).
prerequisito(compiladores, estrutura_dados).
prerequisito(sistemas_operacionais, estrutura_dados).
prerequisito(teoria_grafos, calculo1).
prerequisito(estatistica, calculo1).
prerequisito(projeto_integrador, banco_dados).
prerequisito(projeto_integrador, sistemas_operacionais).

% Fatos: Conhecimento de Alunos (aluno, disciplina_concluida)
% Configuração de Alunos para testes:
concluiu(maria, programacao1).
concluiu(maria, calculo1).
concluiu(joao, programacao1).
concluiu(joao, estrutura_dados).
concluiu(joao, calculo1).
concluiu(ana, programacao1).
concluiu(ana, redes).
concluiu(ana, teoria_grafos).
concluiu(pedro, calculo1).
concluiu(pedro, estatistica).
concluiu(pedro, teoria_grafos).
concluiu(lucas, estrutura_dados).
concluiu(lucas, algoritmos).
concluiu(lucas, redes). 
concluiu(lucas, banco_dados).

alto_impacto(D):-
    prerequisito(D1, D),
	prerequisito(D2, D),
    D1 \= D2,
    disciplina(D, CRED),
    CRED >= 5.

falta_concluir(Aluno, Disciplina):-
    prerequisito(Disciplina, _),
    \+ concluiu(Aluno, Disciplina).

aluno_apto(Aluno, Disciplina):-
    prerequisito(Disciplina, _),
    \+ falta_concluir(Aluno, Disciplina).

especialista_comp(Aluno):-
    concluiu(Aluno, _),
    findall(D, (concluiu(Aluno, D), disciplina(D, _, computacao)), Lista),
    length(Lista, Total),
    Total >= 2.

deficiencia_mat(Aluno):-
    concluiu(Aluno, _),
    \+ (concluiu(Aluno, D), disciplina(D, _, matematica)).

disciplina_raiz(D):-
    disciplina(D, _, _),
    \+ prerequisito(D, _).

disciplina_folha(D):-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

% Query ex1 : ?- disciplina(D, 4, matematica),
% \+ prerequisito(ALGO, D).

% Query ex2: ?- aluno_apto(João, D).
% ?- aluno_apto(Maria, inteligencia_artificial).

% Query ex3: ?- setof(A, (especialista_comp(A), deficiencia_mat(A)), Lista).

% Query ex4: ?- disciplina_raiz(Disciplina),
% \+ disciplina(Disciplina, _, aplicacoes).