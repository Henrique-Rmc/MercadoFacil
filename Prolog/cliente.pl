:- use_module(library(csv)).
:- include('menus.pl').
:- include('util.pl').

loginCliente:-
    menuCliente,
    read(Op),
    opcaoCliente(Op),
    halt.

opcaoCliente(1):- listarProdutosC.


listarProdutosC:-
    writeln("-----CLIENTES CADASTRADOS-----"),
    readCsv('produtos.csv', R),
    writeln(R).
