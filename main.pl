menu :- write('Bem vindo ao Show do Milhão!'), nl,
        write('Escolha uma das opções:'), nl,
        write('1. Jogar'),nl,
        write('2. Regras'),nl,
        write('3. Sair'),nl,
        read(Op),
        opcao(Op).

% if Op == 1:
opcao(1) :- write('Em desenvolvimento...').

% if Op == 2:
opcao(2) :- write('Escrever as regras do jogo aqui.').

% if Op == 3:
opcao(3) :- write('Até mais!').