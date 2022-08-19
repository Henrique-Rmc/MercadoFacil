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
    sucesso),
    
    main.


excluirMercado:-
    writeln("Informe o CNPJ do Mercado a ser excluido: "),
    read(Cnpj),

    readCsv('mercados.csv', M),

    isValid(Cnpj, M, Valid),
    (Valid -> geraListaExcluida(Cnpj, M, R),
    remove(R, M, ListaM),

    limpaCsv('mercados.csv'),

    refazMercado(ListaM),

    readCsv('produtos.csv', P),
    geraListasExcluidas(Cnpj, P, ListaP),

    limpaCsv('produtos.csv'),

    refazProdutos(ListaP),
    writeln("Mercado Removido com sucesso");falhaCnpj, main),

    main.



main:-
    menuPrincipal,

    read(Op),

    opcaoSelecionada(Op), halt.

opcaoSelecionada(1):- loginMercado.
opcaoSelecionada(2):- loginCliente.    
opcaoSelecionada(3):- cadastrandoMercado.
opcaoSelecionada(4):- excluirMercado.
opcaoSelecionada(0):- halt.


