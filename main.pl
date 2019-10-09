imprimeQuestao([]).
imprimeQuestao([X|Y]):-
        format("~w\n", X),
        imprimeQuestao(Y).

end() :-
		write(" Parabéns, você me venceu!! Até a próxima.\n"),
		halt(0).

fase():-imprimeQuestao([['1'],'QUEM','1.michael jacson','2.bbbbbbbbb']),VERIFICAend().
