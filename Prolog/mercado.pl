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
    isValid(Cnpj, R, Bool),
    listaMercadoCnpj(Cnpj, R, Resposta),
    

    
    
    meusProdutos,
    readCsv('produtos.csv', R),
