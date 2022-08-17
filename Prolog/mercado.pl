:- use_module(library(csv)).
:- include('menus.pl').
:- include('util.pl').

loginMercado:-
    menuMercado,

    read(Op),

    opcaoMercado(Op),

    halt.

opcaoMercado(1):- cadastrandoProduto(X).
opcaoMercado(2):- listarProdutos.
opcaoMercado(0):- main.


cadastrandoProduto(X):-
    cnpjMercado,
    read(Cnpj),

    readCsv('mercados.csv', M),

    isValid(Cnpj, M, Valid),

    (Valid ->   
    nomeProduto,
    read(Nome),

    valorProduto,
    read(Valor),

    setorProduto,
    read(Setor),

    readCsv('produtos.csv', R),
    adicionaProduto(Cnpj, Nome, Valor, Setor),
    sucesso;
    falhaCnpj
    ),

    loginMercado.
 

listarProdutos:-
    cnpjMercado,
    read(Cnpj),

    readCsv('produtos.csv', R),

    busca(Cnpj, R, Resposta),
    (Resposta -> writeln(Resposta);
    falhaCnpj),
    loginMercado.
    
