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
opcaoCliente(5):- buscarSetorPorMercado.
opcaoCliente(6):- buscarProdutoBarato.
opcaoCliente(0):- main.

listarTodosProdutos:-
    writeln("-----PRODUTOS CADASTRADOS-----"),
    readCsv('produtos.csv', R),
    listaProdutos(R),
    loginCliente.
 
buscarProdutosCnpj:-

    readCsv('mercados.csv', M),
    apresentaMercados,
    listaCnpjs(M),

    cnpjMercado,
    read(Cnpj),

    readCsv('produtos.csv', R),
    isValid(Cnpj,R,Valid),

    (Valid -> busca(Cnpj, R, Resposta), listaProdutos(Resposta);
    falhaBuscaEconomica),
    loginCliente.
 
buscarProdutosNome:-
    recebeNomeProduto,
    read(Nome),

    readCsv('produtos.csv', R),
    isValid(Nome,R,Valid),
    
    (Valid -> busca(Nome, R, Resposta), listaProdutos(Resposta);
    falhaNome),
    loginCliente.

buscarProdutosSetor:-

    setoresDisponiveis,

    recebeSetorProduto,
    read(Setor),

    readCsv('produtos.csv', R),
    isValid(Setor,R,Valid),

    (Valid -> busca(Setor, R, Resposta), listaProdutos(Resposta);
    falhaSetor),

    loginCliente.

buscarProdutoBarato:-
    recebeProdutoBarato,
    read(Name),

    readCsv('produtos.csv', R),

    isValid(Name, R, Valid),

    (Valid -> 
    busca(Name, R,[H|T]),

    buscaEconomica([H|T], H, MenorPreco),

    mostraProdutoBarato(MenorPreco);
    
    falhaProduto),

    loginCliente.


buscarSetorPorMercado:-

    readCsv('produtos.csv', R),

    readCsv('mercados.csv', M),

    setoresDisponiveis,
    
    recebeSetorProduto,
    read(Setor),

    isValid(Setor,R,SetorValid),
    (SetorValid -> 

    apresentaMercados,
    listaCnpjs(M),
    
    cnpjMercado,
    read(Cnpj),

    busca(Setor, R, Resposta),
    busca(Cnpj, Resposta, Lista),
    listaProdutos(Lista);
    falhaSetor),

    loginCliente.


