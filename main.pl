menu :- write('Bem vindo ao Show do Milhão!'), nl,
        write('Escolha uma das opções:'), nl,
        write(' Digite 1 para jogar'),nl,
        write(' Digite 2 para ver as regras'),nl,
        write(' Digite 3 para ver historico'),nl,
        write(' Digite 3 para sair'),nl,
        read(Op),
        opcao(Op).

% if Op == 1:
opcao(1) :- iniciajogo().

% if Op == 2:
opcao(2) :- write('Escrever as regras do jogo aqui.').

% if Op == 3:
opcao(3) :- historico().

% if Op == 4:
opcao(3) :- write('Até mais!'),
halt(0).


iniciajogo() :- 
            write("inicia jogo").


historico() :- 
            write("mostra historico").