:- (initialization main).
:- include('menus.pl').
:- include('mercado.pl').

main:-
    menuPrincipal,
    read(Op),
    opcaoSelecionada(Op), 
    halt.

opcaoSelecionada(1):- loginMercado(L).

