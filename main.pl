:- dynamic jogador/2.
:- discontiguous fase/1.
:- discontiguous questao/1.

menu :- write('Bem vindo ao Show do Milhão!'), nl,
        write('Escolha uma das opções:'), nl,
        write(' Digite 1 para jogar'),nl,
        write(' Digite 2 para ver as regras'),nl,
        write(' Digite 3 para ver historico'),nl,
        write(' Digite 4 para sair'),nl,
        read(Op),
        opcao(Op).

% if Op == 1:
opcao(1) :- iniciajogo().

% if Op == 2:
opcao(2) :- write('(1) - O jogo possui 10 fases.'),nl,
            write('(2) - Cada fase possui 1 uma pergunta.'),nl,
            write('(3) - Se o jogador acertar a pergunta ele passa para próxima fase.'),nl,
            write('(4) - O jogador poderá desistir recebendo 40% da quantia da ultima rodada que acertou.'),nl,
            write('(5) - O jogador poderá ter auxílio na resolução das perguntas, universitários, plateia'),nl,
            write('(6) - O jogador ganha se acertar a ultima questão.'),nl,
            write('(7) - O jogo termina se o jogador desistir ou errar alguma questão.'),nl,
            menu.

% if Op == 3:
opcao(3) :- historico().

% if Op == 4:
opcao(4) :- write('Até mais!'),nl,
            halt.

iniciajogo():- fase(1).
            
historico() :- 
            setof(Nome-Pontuacao, jogador(Nome, Pontuacao), L),
            write(L).

imprimeQuestao([]).
imprimeQuestao([X|Y]):-
        format("~w\n", X),
        imprimeQuestao(Y).

registraUsuario(Pontuacao) :-
            write('Digite seu nome: '),nl,
            read(Nome),
            memoriza(jogador(Nome, Pontuacao)).

save_txt :- jogador(X, Y),
            open('historico.txt', append, Arq),
            write(Arq, X), tab(Arq, 3), write(Arq, Y),
            nl(Arq),
            close(Arq).

erase_all :- esquece(jogador(X, Y)).
erase_all.

esquece(X) :- retract(X).
esquece(X).

memoriza(X) :- esquece(X), assert(X).

end() :-
        cls,
        write(" MAH OI, VOCÊ GANHOU 1 MILHÃO DE REAIS!\n Até a próxima.\n"),
        halt(0).

cls :- write('\33\[2J').

pontuacaoFinal(Pontuacao) :- registraUsuario(Pontuacao).

perdeuJogo():-write("Deseja jogar novamente?\n s para sim\n n para nao\n"), read(s),fase(1).
perdeuJogo():-cls,write("NÃO CONSEGUE NÉ MOISES? ATÉ A PROXIMA\n").

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
questao(6):-cls, write("Voce perdeu!!!\n"), pontuacaoFinal(1000), perdeuJogo().

questao(7):-imprimeQuestao(['Quantas casas decimais tem o número pi?',
'a) Duas',
'b) Centenas',
'c) Trilhares',
'd) Vinte',
'e) Milhares']), read(c), fase(3).
questao(7):-cls, write("Voce perdeu!!!\n"), pontuacaoFinal(1000), perdeuJogo().

questao(8):-imprimeQuestao(['De quem é a famosa frase “Penso, logo existo”?',
'a) Platão',
'b) Galileu Galilei',
'c) Descartes',
'd) Sócrates',
'e) Francis Bacon']), read(c), fase(3).
questao(8):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(1000), perdeuJogo().

questao(9):-imprimeQuestao(['Atualmente, quantos elementos químicos a tabela periódica possui?',
'a) 113',
'b) 109',
'c) 108',
'd) 118',
'e) 92']), read(d),fase(3).
questao(9):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(1000), perdeuJogo().

questao(10):-imprimeQuestao(['Quais os países que têm a maior e a menor expectativa de vida do mundo?',
'a) Japão e Serra Leoa',
'b) Austrália e Afeganistão',
'c) Itália e Chade',
'd) Brasil e Congo',
'e) Estados Unidos e Angola']), read(a),fase(3).
questao(10):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(1000), perdeuJogo().


fase(3):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 5.000 REAIS!\n"), random(11, 15, X), questao(X).
questao(11):-imprimeQuestao(['O que a palavra legend significa em português?',
'a) Legenda',
'b) Conto',
'c) História',
'd) Lenda',
'e) Legendário']),read(d), fase(4).
questao(11):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(2000), perdeuJogo().

questao(12):-imprimeQuestao(['Qual o número mínimo de jogadores numa partida de futebol?',
'a) 8',
'b) 10',
'c) 9',
'd) 5',
'e) 7']),read(e), fase(4).
questao(12):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(2000), perdeuJogo().

questao(13):-imprimeQuestao(['Quais os principais autores do Barroco no Brasil?',
'a) Gregório de Matos, Bento Teixeira e Manuel Botelho de Oliveira',
'b) Miguel de Cervantes, Gregório de Matos e Danthe Alighieri',
'c) Padre Antônio Vieira, Padre Manuel de Melo e Gregório de Matos',
'd) Castro Alves, Bento Teixeira e Manuel Botelho de Oliveira',
'e) Álvares de Azevedo, Gregório de Matos e Bento Teixeira']),read(a), fase(4).
questao(13):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(2000), perdeuJogo().

questao(14):-imprimeQuestao(['Quais as duas datas que são comemoradas em novembro?',
'a) Independência do Brasil e Dia da Bandeira',
'b) Proclamação da República e Dia Nacional da Consciência Negra',
'c) Dia do Médico e Dia de São Lucas',
'd) Dia de Finados e Dia Nacional do Livro',
'e) Black Friday e Dia da Árvore']),read(b), fase(4).
questao(14):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(2000), perdeuJogo().

questao(15):-imprimeQuestao(['Quem pintou "Guernica"?',
'a) Paul Cézanne',
'b) Pablo Picasso',
'c) Diego Rivera',
'd) Tarsila do Amaral',
'e) Salvador Dalí']),read(b), fase(4).
questao(15):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(2000), perdeuJogo().

fase(4):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 10.000 REAIS!\n"), random(16, 20, X), questao(X).
questao(16):-imprimeQuestao(['Quanto tempo a luz do Sol demora para chegar à Terra?',
'a) 12 minutos',
'b) 1 dia',
'c) 12 horas',
'd) 8 minutos',
'e) segundos']),read(d), fase(5).
questao(16):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(5000), perdeuJogo().

questao(17):-imprimeQuestao(['Qual a tradução da frase “Fabiano cogió su saco antes de salir”?',
'a) Fabiano coseu seu paletó antes de sair',
'b) Fabiano fechou o saco antes de sair',
'c) Fabiano pegou seu paletó antes de sair',
'd) Fabiano cortou o saco antes de cair',
'e) Fabiano rasgou seu paletó antes de cair']),read(c), fase(5).
questao(17):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(5000), perdeuJogo().

questao(18):-imprimeQuestao(['Qual a nacionalidade de Che Guevara?',
'a) Cubana',
'b) Peruana',
'c) Panamenha',
'd) Boliviana',
'e) Argentina']),read(e), fase(5).
questao(18):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(5000), perdeuJogo().

questao(19):-imprimeQuestao(['Quais são os três predadores do reino animal reconhecidos pela habilidade de caçar em grupo, se camuflar para surpreender as presas e possuir sentidos apurados, respectivamente:',
'a) Tubarão branco, crocodilo e sucuri',
'b) Tigre, gavião e orca',
'c) Hiena, urso branco e lobo cinzento',
'd) Orca, onça e tarântula',
'e) Leão, tubarão branco e urso cinzento']),read(c), fase(5).
questao(19):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(5000), perdeuJogo().

questao(20):-imprimeQuestao([ 'Qual a altura da rede de vôlei nos jogos masculino e feminino?',
'a) 2,4 para ambos',
'b) 2,5 m e 2,0 m',
'c) 1,8 m e 1,5 m',
'd) 2,45 m e 2,15 m',
'e) 2,43 m e 2,24 m']),read(e), fase(5).
questao(20):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(5000), perdeuJogo().

fase(5):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 20.000 REAIS!\n"), random(21, 25, X), questao(X).

questao(21):-imprimeQuestao(['Em que ordem surgiram os modelos atômicos?',
'a) Thomson, Dalton, Rutherford, Rutherford-Bohr',
'b) Rutherford-Bohr, Rutherford, Thomson, Dalton',
'c) Dalton, Rutherford-Bohr, Thomson, Rutherford',
'd) Dalton, Thomson, Rutherford-Bohr, Rutherford',
'e) Dalton, Thomson, Rutherford, Rutherford-Bohr']),read(e), fase(6).
questao(21):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(10000), perdeuJogo().

questao(22):-imprimeQuestao(['Qual personagem folclórico costuma ser agradado pelos caçadores com a oferta de fumo?',
'a) Caipora',
'b) Saci',
'c) Lobisomem',
'd) Boitatá',
'e) Negrinho do Pastoreio']),read(a), fase(6).
questao(22):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(10000), perdeuJogo().

questao(23):-imprimeQuestao(['Em que período da pré-história o fogo foi descoberto?',
'a) Neolítico',
'b) Paleolítico',
'c) Idade dos Metais',
'd) Período da Pedra Polida',
'e) Idade Média']),read(b), fase(6).
questao(23):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(10000), perdeuJogo().

questao(24):-imprimeQuestao(['Qual das alternativas abaixo apenas contêm classes de palavras?',
'a) Vogais, semivogais e consoantes',
'b) Artigo, verbo transitivo e verbo intransitivo',
'c) Fonologia, Morfologia e Sintaxe',
'd) Hiatos, ditongos e tritongos',
'e) Substantivo, verbo e preposição']),read(e), fase(6).
questao(24):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(10000), perdeuJogo().

questao(25):-imprimeQuestao(['Qual a montanha mais alta do Brasil?',
'a) Pico da Neblina',
'b) Pico Paraná',
'c) Monte Roraima',
'd) Pico Maior de Friburgo',
'e) Pico da Bandeira']),read(a), fase(6).
questao(25):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(10000), perdeuJogo().


fase(6):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 50.000 REAIS!\n"), random(26, 30, X), questao(X).
questao(26):-imprimeQuestao(['Qual a velocidade da luz?',
'a) 300 000 000 metros por segundo (m/s)',
'b) 150 000 000 metros por segundo (m/s)',
'c) 199 792 458 metros por segundo (m/s)',
'd) 299 792 458 metros por segundo (m/s)',
'e) 30 000 000 metros por segundo (m/s)']),read(d), fase(7).
questao(26):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(20000), perdeuJogo().

questao(27):-imprimeQuestao(['Em qual local da Ásia o português é língua oficial?',
'a) Índia',
'b) Filipinas',
'c) Moçambique',
'd) Macau',
'e) Portugal']),read(d), fase(7).
questao(27):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(20000), perdeuJogo().

questao(28):-imprimeQuestao(['“It is six twenty ou twenty past six”. Que horas são em inglês?',
'a) 12:06',
'b) 6:20',
'c) 2:20',
'd) 6:02',
'e) 12:20']),read(b), fase(7).
questao(28):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(20000), perdeuJogo().

questao(29):-imprimeQuestao(['Quem é o autor de “O Príncipe”?',
'a) Maquiavel',
'b) Antoine de Saint-Exupéry',
'c) Montesquieu',
'd) Thomas Hobbes',
'e) Rousseau']),read(a), fase(7).
questao(29):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(20000), perdeuJogo().

questao(30):-imprimeQuestao(['Como é a conjugação do verbo caber na 1.ª pessoa do singular do presente do indicativo?',
'a) Eu caibo',
'b) Ele cabe',
'c) Que eu caiba',
'd) Eu cabo',
'e) Nenhuma das alternativas']),read(a), fase(7).
questao(30):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(20000), perdeuJogo().

fase(7):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 100.000 REAIS!\n"), random(31, 35, X), questao(X).
questao(31):-imprimeQuestao(['Quais destas construções famosas ficam nos Estados Unidos?',
'a) Estátua da Liberdade, Golden Gate Bridge e Empire State Building',
'b) Estátua da Liberdade, Big Ben e The High Line',
'c) Angkor Wat, Taj Mahal e Skywalk no Grand Canyon',
'd) Lincoln Memorial, Sidney Opera House e Burj Khalifa',
'e) 30 St Mary Axe, The High Line e Residencial 148 Spruce Street']),read(a), fase(8).
questao(31):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(50000), perdeuJogo().

questao(32):-imprimeQuestao(['Quais destas doenças são sexualmente transmissíveis?',
'a) Aids, tricomoníase e ebola',
'b) Chikungunya, aids e herpes genital',
'c) Gonorreia, clamídia e sífilis',
'd) Botulismo, cistite e gonorreia',
'e) Hepatite B, febre tifoide e hanseníase']),read(c), fase(8).
questao(32):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(50000), perdeuJogo().

questao(33):-imprimeQuestao(['Qual destes países é transcontinental?',
'a) Rússia',
'b) Filipinas',
'c) Istambul',
'd) Groenlândia',
'e) Tanzânia']),read(a), fase(8).
questao(33):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(50000), perdeuJogo().

questao(34):-imprimeQuestao(['Em qual das orações abaixo a palavra foi empregada incorretamente?',
'a) Mais uma vez, portou-se mal.',
'b) É um homem mal.',
'c) Esse é o mal de todos.',
'd) Mal falou nele, o fulano apareceu.',
'e) É um mau vendedor.']),read(b), fase(8).
questao(34):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(50000), perdeuJogo().

questao(35):-imprimeQuestao(['Qual foi o recurso utilizado inicialmente pelo homem para explicar a origem das coisas?',
'a) A Filosofia',
'b) A Biologia',
'c) A Matemática',
'd) A Astronomia',
'e) A Mitologia']),read(e), fase(8).
questao(35):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(50000), perdeuJogo().

fase(8):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 200.000 REAIS!\n"), random(36, 40, X), questao(X).
questao(36):-imprimeQuestao(['Qual das alternativas menciona apenas símbolos nacionais?',
'a) Bandeira insígnia da presidência, bandeira nacional, brasão, hinos e selo',
'b) Bandeira nacional, armas nacionais, hino nacional e selo nacional',
'c) Bandeira nacional, brasão, hino nacional e hino da independência',
'd) Bandeira nacional, cores nacionais, hino nacional e hino da independência',
'e) Bandeira insígnia da presidência, brasão flora e fauna e hinos']),read(b), fase(9).
questao(36):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(100000), perdeuJogo().

questao(37):-imprimeQuestao(['Quais os planetas do sistema solar?',
'a) Terra, Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio',
'b) Júpiter, Marte, Mercúrio, Netuno, Plutão, Saturno, Terra, Urano, Vênus',
'c) Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio',
'd) Júpiter, Marte, Mercúrio, Netuno, Plutão, Saturno, Sol, Terra, Urano, Vênus',
'e) Terra, Vênus, Saturno, Júpiter, Marte, Netuno, Mercúrio']),read(a), fase(9).
questao(37):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(100000), perdeuJogo().

questao(38):-imprimeQuestao(['Qual era o nome de Aleijadinho?',
'a) Alexandrino Francisco Lisboa',
'b) Manuel Francisco Lisboa',
'c) Alex Francisco Lisboa',
'd) Francisco Antônio Lisboa',
'e) Antônio Francisco Lisboa']),read(e), fase(9).
questao(38):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(100000), perdeuJogo().

questao(39):-imprimeQuestao(['Júpiter e Plutão são os correlatos romanos de quais deuses gregos?',
'a) Ares e Hermes',
'b) Cronos e Apolo',
'c) Zeus e Hades',
'd) Dionísio e Deméter',
'e) Zeus e Ares']),read(c), fase(9).
questao(39):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(100000), perdeuJogo().

questao(40):-imprimeQuestao(['Qual o maior animal terrestre?',
'a) Baleia Azul',
'b) Dinossauro',
'c) Elefante africano',
'd) Tubarão Branco',
'e) Girafa']),read(c), fase(9).
questao(40):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(100000), perdeuJogo().

fase(9):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("MAHH OLHA SÓ\n VALENDO 500.000 REAIS!\n"), random(41, 45, X), questao(X).
questao(41):-imprimeQuestao(['Qual o tema do famoso discurso Eu Tenho um Sonho, de Martin Luther King?',
'a) Igualdade das raças',
'b) Justiça para os menos favorecidos',
'c) Intolerância religiosa',
'd) Prêmio Nobel da Paz',
'e) Luta contra o Apartheid']),read(a), fase(10).
questao(41):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(200000), perdeuJogo().

questao(42):-imprimeQuestao(['Que líder mundial ficou conhecida como “Dama de Ferro”?',
'a) Dilma Rousseff',
'b) Angela Merkel',
'c) Margaret Thatcher',
'd) Hillary Clinton',
'e) Christine Lagarde']),read(c), fase(10).
questao(42):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(200000), perdeuJogo().

questao(43):-imprimeQuestao(['O que são Acordo de Paris e Tríplice Aliança respectivamente?',
'a) Acordo ortográfico entre países cuja língua oficial é o francês e Acordo de cooperação financeira internacional entre as três maiores potências mundiais',
'b) Acordo entre países europeus acerca da imigração e Acordo econômico entre Inglaterra, Rússia a França',
'c) Acordo entre vários países acerca das consequências do aquecimento global e Acordo de cooperação financeira internacional entre as três maiores potências mundiais',
'd) Acordo de cooperação financeira internacional entre as três maiores potências mundiais e Acordo entre vários países acerca das consequências do aquecimento global',
'e) Acordo entre vários países acerca das consequências do aquecimento global e Acordo entre Alemanha, império Austro-Húngaro e Itália acerca de apoio em caso de guerra']),read(e), fase(10).
questao(43):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(200000), perdeuJogo().

questao(44):-imprimeQuestao(['Quais os nomes dos três Reis Magos?',
'a) Gaspar, Nicolau e Natanael',
'b) Belchior, Gaspar e Baltazar',
'c) Belchior, Gaspar e Nataniel',
'd) Gabriel, Benjamim e Melchior',
'e) Melchior, Noé e Galileu']),read(b), fase(10).
questao(44):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(200000), perdeuJogo().

questao(45):-imprimeQuestao(['Quais os principais heterônimos de Fernando Pessoa?',
'a) Alberto Caeiro, Ricardo Reis e Álvaro de Campos',
'b) Ariano Suassuna, Raul Bopp e Quincas Borba',
'c) Bento Teixeira, Ricardo Reis e Haroldo de Campos',
'd) Alberto Caeiro, Ricardo Leite e Augusto de Campos',
'e) Bento Teixeira, Ricardo Reis e Augusto de Campos']),read(a), fase(10).
questao(45):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(200000), perdeuJogo().

fase(10):-cls,write("CERTA RESPOSTA (tanananan)\n"), write("PERGUNTA FINAL\nMAHH OLHA SÓ\n VALENDO 1.000.000 REAIS!\n"), random(46, 50, X), questao(X).
questao(46):-imprimeQuestao(['Qual a religião monoteísta que conta com o maior número de adeptos no mundo?',
'a) Judaísmo',
'b) Zoroastrismo',
'c) Islamismo',
'd) Cristianismo',
'e) Hinduísmo']),read(d), end().
questao(46):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(500000), perdeuJogo().

questao(47):-imprimeQuestao(['Qual desses filmes foi baseado na obra de Shakespeare?',
'a) Muito Barulho por Nada (2012)',
'b) Capitães de Areia (2011)',
'c) A Dama das Camélias (1936)',
'd) A Revolução dos Bichos (1954)',
'e) Excalibur (1981)']),read(a), end().
questao(47):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(500000), perdeuJogo().

questao(48):-imprimeQuestao(['Quem foi o primeiro homem a pisar na Lua? Em que ano aconteceu?',
'a) Yuri Gagarin, em 1961',
'b) Buzz Aldrin, em 1969',
'c) Charles Conrad, em 1969',
'd) Charles Duke, em 1971',
'e) Neils Armstrong, em 1969.']),read(e), end().
questao(48):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(500000), perdeuJogo().

questao(49):-imprimeQuestao(['Qual o nome do cientista que descobriu o processo de pasteurização e a vacina contra a raiva?',
'a) Marie Curie',
'b) Blaise Pascal',
'c) Louis Pasteurs',
'd) Antoine Lavoisier',
'e) Charles Darwin']),read(c), end().
questao(49):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(500000), perdeuJogo().

questao(50):-imprimeQuestao(['As pessoas de qual tipo sanguíneo são consideradas doadores universais?',
'a) Tipo A',
'b) Tipo B',
'c) Tipo O',
'd) Tipo AB',
'e) Tipo ABO']),read(c), end().
questao(50):-cls,write("Voce perdeu!!!\n"), pontuacaoFinal(500000), perdeuJogo().
