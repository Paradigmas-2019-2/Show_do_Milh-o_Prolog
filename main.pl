menu :- write('Bem vindo ao Show do Milhão!'), nl,
        write('Escolha uma das opções:'), nl,
        write(' Digite 1 para jogar'),nl,
        write(' Digite 2 para ver as regras'),nl,
        write(' Digite 3 para ver historico'),nl,
        write(' Digite 4 para sair'),nl,
        read(Op),
        opcao(Op).

% if Op == 1:
opcao(1) :- registraUsuario(),
            iniciajogo().

% if Op == 2:
opcao(2) :- write('O jogo consiste em três rodadas e uma pergunta final: '),nl,
            write('A primeira rodada contem 5 perguntas, cada uma valendo R$ 1.000 cumulativos. '),nl,
            write('A segunda rodada contem 5 perguntas valendo R$ 10.000 cumulativos cada. '),nl,
            write('A terceira rodada contem 5 perguntas de R$ 100.000 reais cumulativos cada. '),nl,
            write('A última pergunta vale R$ 1.000.000'),nl,nl,
            menu.

% if Op == 3:
opcao(3) :- historico().

% if Op == 4:
opcao(3) :- write('Até mais!'),
halt(0).

iniciajogo() :- 
            write("inicia jogo").

historico() :- 
            write("mostra historico").

registraUsuario() :-
            write('Digite seu nome: '),nl,
            read(Nome).
