imprimeQuestao([]).
imprimeQuestao([X|Y]):-
        format("~w\n", X),
        imprimeQuestao(Y).


seleciona([X|_],0,H):-
        imprimeQuestao(X),!.
         
seleciona([_|Z],Y,H):-
        Y > 0, 
        Y1 is Y-1,
        seleciona(Z,Y1,H). 

end() :-
		write(" Parabéns, você me venceu!! Até a próxima.\n"),
		halt(0).

fase():- seleciona([
    ['1- Quem inventou a lampada?','A) Thomas Edson.','B) João kleber','C) Ronaldinho Gaúcho.','D) Matheus Estanislau.'],
    ['Qual é o maior país do mundo?','A) Butão.','B) Russia.','C) Venezuela.','D) Matheus Estanislau.'],['A'],['B']
],1,A),seleciona([['1- Quem inventou a lampada?','A) Thomas Edson.','B) João kleber','C) Ronaldinho Gaúcho.','D) Matheus Estanislau.'],
    ['Qual é o maior país do mundo?','A) Butão.','B) Russia.','C) Venezuela.','D) Matheus Estanislau.'],['A'],['B']],1+2,B),end().


