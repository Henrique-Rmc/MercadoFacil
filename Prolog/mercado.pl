:- use_module(library(csv)).
:- include('menus.pl').
:- include('util.pl').

loginMercado(X):-
    menuMercado,
    read(Op),
    opcaoMercado(Op),
    halt.

opcaoMercado(1):- cadastrandoProduto(X).

cadastrandoProduto(X):-
    nomeProduto,
    read(Nome),

    valorProduto,
    read(Valor),
    readCsv('produtos.csv', R),
    adicionaProduto(Nome, Valor),
    write("Produto Cadastrado").
