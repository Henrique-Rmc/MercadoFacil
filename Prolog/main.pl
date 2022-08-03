:- (initialization main).
:- include('menus.pl').
:- include('mercado.pl').
:- include('cliente.pl').

main:-
    menuPrincipal,
    read(Op),
    opcaoSelecionada(Op), 
    halt.

opcaoSelecionada(1):- loginMercado(L).
opcaoSelecionada(2):- loginCliente(L).

