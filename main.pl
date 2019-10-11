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
opcao(4) :- write('Até mais!'),nl,
            halt.

iniciajogo() :- 
            write("Vamos lá"),nl,
            random(0,3,Numquestao),
            % gera um numero aleatorio entre 0 a 3
            questao(Numquestao).
            % chama uma função onde deve ter a questao chamada
            

historico() :- 
            write("mostra historico").

registraUsuario() :-
            write('Digite seu nome: '),nl,
            read(Nome).

questao(0) :- 
            write("entrou na 0"),nl.
questao(1) :- 
            write("entrou na 1"),nl.
questao(2) :- 
            write("entrou na 2"),nl.
questao(3) :- 
            write("entrou na 3"),nl.
