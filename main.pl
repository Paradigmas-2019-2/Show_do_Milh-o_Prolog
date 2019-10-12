imprimeQuestao([]).
imprimeQuestao([X|Y]):-
        format("~w\n", X),
        imprimeQuestao(Y).

end() :-
                cls,
		write(" MAH OI, VOCÊ GANHOU 1 MILHÃO DE REAIS!\n Até a próxima.\n"),
		halt(0).

cls :- write('\33\[2J').

perdeuJogo():-cls,write("Deseja jogar novamente?\n s para sim\n n para nao\n") read(s),fase(1).
perdeuJogo():-cls,write("NÃO CONSEGUE NÉ MOISES? ATÉ A PROXIMA\n"),halt(0).

fase(1):-cls,write("MAHH OLHA SÓ, VAI COMEÇAR O SHOW DO MILHÃO, VALENDO 1000 REAIS! (tananananananan)\n"),random(1,5,X), questao(X).
 
questao(1):-imprimeQuestao(['Normalmente, quantos litros de sangue uma pessoa tem? Em média, quantos são retirados numa doação de sangue?',
'a) Tem entre 2 a 4 litros. São retirados 450 mililitros',
'b) Tem entre 4 a 6 litros. São retirados 450 mililitros',
'c) Tem 10 litros. São retirados 2 litros',
'd) Tem 7 litros. São retirados 1,5 litros',
'e) Tem 0,5 litros. São retirados 0,5 litros']), read(b), fase(2).
questao(1):-cls, write("Voce perdeu!!!\n"),sleep(1), perdeuJogo().

questao(2):-imprimeQuestao(['Qual o nome do presidente do Brasil que ficou conhecido como Jango”?',
'a) Jânio Quadros',
'b) Jacinto Anjos',
'c) Getúlio Vargas',
'd) João Figueiredo',
'e) João Goulart']), read(e), fase(2).
questao(2):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

questao(3):-imprimeQuestao(['Quais o menor e o maior país do mundo?',
'a) Vaticano e Rússia',
'b) Nauru e China',
'c) Mônaco e Canadá',
'd) Malta e Estados Unidos',
'e) São Marino e Índia']), read(a), fase(2).
questao(3):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

questao(4):-imprimeQuestao(['De onde é a invenção do chuveiro elétrico?',
'a) França',
'b) Inglaterra',
'c) Brasil',
'd) Austrália',
'e) Itália']), read(c), fase(2).
questao(4):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

questao(5):-imprimeQuestao(['Qual o grupo em que todas as palavras foram escritas corretamente?',
'a) Asterístico, beneficiente, meteorologia, entertido',
'b) Asterisco, beneficente, meteorologia, entretido,',
'c) Asterisco, beneficente, metereologia, entretido,',
'd) Asterístico, beneficiente, metereologia, entretido,',
'e) Asterisco, beneficiente, metereologia, entretido']), read(b), fase(2).

questao(5):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

fase(2):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 2.000 REAIS!\n"), random(6, 10, X), questao(X).

questao(6):-imprimeQuestao(['Qual o livro mais vendido no mundo a seguir à Bíblia?',
'a) O Senhor dos Anéis',
'b) Dom Quixote',
'c) O Pequeno Príncipe',
'd) Ela, a Feiticeira',
'e) Um Conto de Duas Cidades']), read(b), fase(3).
questao(6):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

questao(7):-imprimeQuestao(['Quantas casas decimais tem o número pi?',
'a) Duas',
'b) Centenas',
'c) Trilhares',
'd) Vinte',
'e) Milhares']), read(c), fase(3).
questao(7):-cls, write("Voce perdeu!!!\n"), perdeuJogo().

questao(8):-imprimeQuestao(['De quem é a famosa frase “Penso, logo existo”?',
'a) Platão',
'b) Galileu Galilei',
'c) Descartes',
'd) Sócrates',
'e) Francis Bacon']), read(c), fase(3).
questao(8):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(9):-imprimeQuestao(['Atualmente, quantos elementos químicos a tabela periódica possui?',
'a) 113',
'b) 109',
'c) 108',
'd) 118',
'e) 92']), read(d),fase(3).
questao(9):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(10):-imprimeQuestao(['Quais os países que têm a maior e a menor expectativa de vida do mundo?',
'a) Japão e Serra Leoa',
'b) Austrália e Afeganistão',
'c) Itália e Chade',
'd) Brasil e Congo',
'e) Estados Unidos e Angola']), read(a),fase(3).
questao(10):-cls,write("Voce perdeu!!!\n"), perdeuJogo().


fase(3):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 5.000 REAIS!\n"), random(11, 15, X), questao(X).
questao(11):-imprimeQuestao([]),read(), fase(4).
questao(11):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(12):-imprimeQuestao([]),read(), fase(4).
questao(12):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(13):-imprimeQuestao([]),read(), fase(4).
questao(13):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(14):-imprimeQuestao([]),read(), fase(4).
questao(14):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(15):-imprimeQuestao([]),read(), fase(4).
questao(15):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(4):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 10.000 REAIS!\n"), random(16, 20, X), questao(X).
questao(16):-imprimeQuestao([]),read(), fase(5).
questao(16):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(17):-imprimeQuestao([]),read(), fase(5).
questao(17):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(18):-imprimeQuestao([]),read(), fase(5).
questao(18):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(19):-imprimeQuestao([]),read(), fase(5).
questao(19):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(20):-imprimeQuestao([]),read(), fase(5).
questao(20):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(5):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 20.000 REAIS!\n"), random(21, 25, X), questao(X).
questao(21):-imprimeQuestao([]),read(), fase(6).
questao(21):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(22):-imprimeQuestao([]),read(), fase(6).
questao(22):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(23):-imprimeQuestao([]),read(), fase(6).
questao(23):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(24):-imprimeQuestao([]),read(), fase(6).
questao(24):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(25):-imprimeQuestao([]),read(), fase(6).
questao(25):-cls,write("Voce perdeu!!!\n"), perdeuJogo().


fase(6):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 50.000 REAIS!\n"), random(26, 30, X), questao(X).
questao(26):-imprimeQuestao([]),read(), fase(7).
questao(26):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(27):-imprimeQuestao([]),read(), fase(7).
questao(27):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(28):-imprimeQuestao([]),read(), fase(7).
questao(28):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(29):-imprimeQuestao([]),read(), fase(7).
questao(29):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(30):-imprimeQuestao([]),read(), fase(7).
questao(30):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(7):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 100.000 REAIS!\n"), random(31, 35, X), questao(X).
questao(31):-imprimeQuestao([]),read(), fase(8).
questao(31):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(32):-imprimeQuestao([]),read(), fase(8).
questao(32):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(33):-imprimeQuestao([]),read(), fase(8).
questao(33):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(34):-imprimeQuestao([]),read(), fase(8).
questao(34):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(35):-imprimeQuestao([]),read(), fase(8).
questao(35):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(8):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 200.000 REAIS!\n"), random(36, 40, X), questao(X).
questao(36):-imprimeQuestao([]),read(), fase(9).
questao(36):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(37):-imprimeQuestao([]),read(), fase(9).
questao(37):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(38):-imprimeQuestao([]),read(), fase(9).
questao(38):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(39):-imprimeQuestao([]),read(), fase(9).
questao(39):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(40):-imprimeQuestao([]),read(), fase(9).
questao(40):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(9):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 500.000 REAIS!\n"), random(41, 45, X), questao(X).
questao(41):-imprimeQuestao([]),read(), fase(10).
questao(41):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(42):-imprimeQuestao([]),read(), fase(10).
questao(42):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(43):-imprimeQuestao([]),read(), fase(10).
questao(43):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(44):-imprimeQuestao([]),read(), fase(10).
questao(44):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(45):-imprimeQuestao([]),read(), fase(10).
questao(45):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

fase(10):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("PERGUNTA FINAL\nMAHH OLHA SÓ\n VALENDO 1.000.000 REAIS!\n"), random(46, 50, X), questao(X).
questao(46):-imprimeQuestao([]),read(), end().
questao(46):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(47):-imprimeQuestao([]),read(), end().
questao(47):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(48):-imprimeQuestao([]),read(), end().
questao(48):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(49):-imprimeQuestao([]),read(), end().
questao(49):-cls,write("Voce perdeu!!!\n"), perdeuJogo().

questao(50):-imprimeQuestao([]),read(), end().
questao(50):-cls,write("Voce perdeu!!!\n"), perdeuJogo().










