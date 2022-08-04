:- use_module(library(csv)).
:- include('menus.pl').
:- include('util.pl').




loginCliente:-
    menuCliente,
    read(Op),
    opcaoCliente(Op),
    halt.

opcaoCliente(1):- listarTodosProdutos.
opcaoCliente(2):- buscarProdutosCnpj.
opcaoCliente(3):- buscarProdutosNome.
opcaoCliente(4):- buscarProdutosSetor.
opcaoCliente(5):- buscarProdutosCnpjSetor.
opcaoCliente(6):- buscarProdutosCnpjNome.
opcaoCliente(0):- main.


listarTodosProdutos:-
    writeln("-----PRODUTOS CADASTRADOS-----"),
    readCsv('produtos.csv', R),
    writeln(R), loginCliente.


buscarProdutosCnpj:-
    
    cnpjMercado,
    read(Cnpj),

    readCsv('produtos.csv', R),

    busca(Cnpj, R, Resposta),
    (Resposta -> writeln(Resposta);
    falhaCnpj),
    loginMercado.

buscarProdutosNome:-
    buscaNomeProduto,
    read(Nome),

    readCsv('produtos.csv', R),

    busca(Nome, R, Resposta),
    (Resposta -> writeln(Resposta);
    falhaNome),
    loginCliente.

buscarProdutosSetor:-
    buscaSetorProduto,
    read(Setor),

    readCsv('produtos.csv', R),

    busca(Setor, R, Resposta),
    (Resposta -> writeln(Resposta);
    falhaNome),
    loginCliente.

