imprimeQuestao([]).
imprimeQuestao([X|Y]):-
        format("~w\n", X),
        imprimeQuestao(Y).


        
end() :-
		write(" Parabéns, você me venceu!! Até a próxima.\n"),
		halt(0).

cls :- write('\33\[2J').

perdeuJogo():-write("Deseja jogar novamente?\n s para sim\n n para nao\n"),get_char(s),fase(1).
perdeuJogo():-write("NÃO CONSEGUE NÉ MOISES? ATÉ A PROXIMA\n"),halt(0).

fase(1):-write("MAHH OLHA SÓ, VAI COMEÇAR O SHOW DO MILHÃO, VALENDO 1000 REAIS! (tananananananan)\n"),random(1,4,X), questao(X).
 
questao(1):-cls,imprimeQuestao(['Normalmente, quantos litros de sangue uma pessoa tem? Em média, quantos são retirados numa doação de sangue?',
'a) Tem entre 2 a 4 litros. São retirados 450 mililitros',
'b) Tem entre 4 a 6 litros. São retirados 450 mililitros',
'c) Tem 10 litros. São retirados 2 litros',
'd) Tem 7 litros. São retirados 1,5 litros',
'e) Tem 0,5 litros. São retirados 0,5 litros']), get_char(b), fase(2).
questao(1):-write("Voce perdeu!!!\n"),sleep(1), perdeuJogo().

questao(2):-cls,imprimeQuestao(['Qual o nome do presidente do Brasil que ficou conhecido como Jango”?',
'a) Jânio Quadros',
'b) Jacinto Anjos',
'c) Getúlio Vargas',
'd) João Figueiredo',
'e) João Goulart']), get_char(e), fase(2).
questao(2):-write("Voce perdeu!!!\n"), perdeuJogo().

questao(3):-cls,imprimeQuestao(['Quais o menor e o maior país do mundo?',
'a) Vaticano e Rússia',
'b) Nauru e China',
'c) Mônaco e Canadá',
'd) Malta e Estados Unidos',
'e) São Marino e Índia']), get_char(a), fase(2).
questao(3):-write("Voce perdeu!!!\n"), perdeuJogo().

questao(4):-cls,imprimeQuestao(['De onde é a invenção do chuveiro elétrico?',
'a) França',
'b) Inglaterra',
'c) Brasil',
'd) Austrália',
'e) Itália']), get_char(c), fase(2).
questao(4):-write("Voce perdeu!!!\n"), perdeuJogo().


fase(2):-write("CERTA RESPOSTA (tanananan)\n"),write("MAHH OLHA SÓ\n VALENDO 10.000 REAIS!\n"),random(6,10,X), questao(X).

