:- (initialization main).
:- include('menus.pl').
:- include('mercado.pl').
:- include('cliente.pl').

cadastrandoMercado:-
    cadastraCnpj,
    read(Cnpj),   

    nomeMercado,
    read(Nome),

    readCsv('mercados.csv', M),

    isValid(Cnpj, M, Valid),
    (Valid -> jaCadastrado;  
                adicionaMercado(Cnpj, Nome),
                sucesso),main.


main:-
    menuPrincipal,

    read(Op),

    opcaoSelecionada(Op), halt.

opcaoSelecionada(1):- loginMercado.
opcaoSelecionada(2):- loginCliente.    
opcaoSelecionada(3):- cadastrandoMercado.
opcaoSelecionada(4):- halt.


