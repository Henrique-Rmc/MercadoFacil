:- (initialization main).
:- include('menus.pl').
:- include('mercado.pl').
:- include('cliente.pl').

cadastrandoMercado:-
    cnpjMercado,
    read(Cnpj),   

    nomeMercado,
    read(Nome),       
    adicionaMercado(Cnpj, Nome),
    sucesso,
    loginMercado.


main:-
    menuPrincipal,

    read(Op),

    opcaoSelecionada(Op), halt.

opcaoSelecionada(1):- loginMercado.
opcaoSelecionada(2):- loginCliente.    
opcaoSelecionada(3):- cadastrandoMercado.


