:- use_module(library(csv)).
:- include('menus.pl').
:- include('util.pl').

loginMercado(X):-
    menuMercado,
    read(Op),
    opcaoMercado(Op),
    halt.

opcaoMercado(1):- cadastrandoProduto(X).
opcaoMercado(2):- listarProdutos.
opcaoMercado(3):- menuPrincipal.


cadastrandoProduto(X):-
    cnpjMercado,
    read(Cnpj),

    nomeProduto,
    read(Nome),

    valorProduto,
    read(Valor),

    setorProduto,
    read(Setor),

    readCsv('produtos.csv', R),
    adicionaProduto(Cnpj, Nome, Valor, Setor),
    sucesso,
    loginMercado(X).


listarProdutos:-
    cnpjMercado,
    read(Cnpj),

    readCsv('produtos.csv', R),

    listaMercadoCnpj(Cnpj, R, Resposta),
    (Resposta -> writeln(Resposta), loginMercado(X);
    falhaCnpj, loginMercado(Menu)).
    
