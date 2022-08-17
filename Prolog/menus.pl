menuPrincipal:-
    writeln("\n-----MENU PRINCIPAL-----"),
    writeln("\nEscolha a opcao desejada"),
    writeln("[1] Login Mercado"),
    writeln("[2] Login Cliente "),
    writeln("[3] Cadastrar Mercado "),
    writeln("[0] Sair\n").


menuMercado:-
    writeln("\n-----MENU MERCADO-----"),
    writeln("\nEscolha a opcao desejada"),
    writeln("[1] Cadastrar Produto"),
    writeln("[2] Listar Produtos "),
    writeln("[0] Sair\n").


menuCliente:-
    writeln("\n-----MENU CLIENTE-----"),
    writeln("\nEscolha a opcao desejada"),
    writeln("[1] Listar todos os Produtos"),
    writeln("[2] Listar Produtos por Cnpj do Mercado"),
    writeln("[3] Buscar Produtos pelo Nome"),
    writeln("[4] Buscar Produtos pelo Setor"),
    writeln("[5] Listar Setor de Um Mercado"),
    writeln("[6] Buscar Produto mais barato"),
    writeln("[0] Sair\n").

recebeNomeProduto:-
    writeln("\nInforme o nome do produto: ").


recebeSetorProduto:-
    writeln("\nInforme o setor dos produtos que deseja buscar: ").

recebeProdutoBarato:-
    writeln("\nInforme o Nome do produto que deseja encontrar:").


nomeProduto:-
    writeln("\n-----CADASTRANDO PRODUTO-----"),
    writeln("\nInforme o nome do produto: ").

valorProduto:-
    writeln("\nInforme o valor do produto: ").

cnpjMercado:-
    writeln("\nInforme o Cnpj do Mercado que deseja acessar: ").

nomeMercado:-
    writeln("\nInforme o Nome do Mercado: ").

setorProduto:-
    writeln("\nInforme o setor do produto: ").

sucesso:-
    writeln("\n Operacao realizada com sucesso"). 

falhaCnpj:-
    writeln("\n Falha em achar Cnpj corresopondente").

cadastraCnpj:-
    writeln("\n Insira o Cnpj do mercado que deseja cadastrar").

falhaNome:-
    writeln("\n Falha em achar um Nome corresopondente").

falhaProduto:-
    writeln("\n Nao foi possivel encontrar um produto correspondente no estoque dos mercados").

falhaSetor:-
    writeln("\n Falha em achar o Setor corresopondente").

existeCnpj:-
    writeln("\n Ja existe um mercado com esse Cnpj cadastrado").

falhaBuscaEconomica:-
    writeln("\n O mercado Buscado não existe ou ainda não possui produtos cadastrados"). 

meusProdutos:-
    writeln("\n Lista dos meus Produtos Cadastrados"). 

setoresDisponiveis:-
    writeln("\n Digite um setor e um mercado: \nhigiene, limpeza, alimentos"). 

apresentaMercados:-
    writeln("\n Mercados em nosso sistema"). 

dadosNaoCorrespondentes:-
    writeln("\n Os dados inseridos não correspondem a nenhum dado do sistema"). 

jaCadastrado:-
    writeln("\n Ja existe um Mercado com esse Cnpj cadastrado no Sistema"). 

listaProdutos([]).
listaProdutos([[Cnpj, Nome, Valor, Setor]|T]):-
    writeln("\n-Cnpj do Mercado:"),writeln(Cnpj),
    writeln("\n-NOME: "),writeln(Nome),
    writeln("\n-VALOR: "),writeln(Valor),
    writeln("\n-SETOR: "), writeln(Setor),
    writeln("------------------"),
    listaProdutos(T).

mostraProdutoBarato([Cnpj, Nome, Valor, Setor]):-
    writeln("\n-Cnpj do Mercado que possui esse produto com melhor valor:"),writeln(Cnpj),
    writeln("\n-Nome: "),writeln(Nome),
    writeln("\n-***MELHOR VALOR!***: "),writeln(Valor),
    writeln("\n-Setor: "), writeln(Setor),
    writeln("------------------").

listaCnpjs([]).
listaCnpjs([[Cnpj, Nome]|T]):-
    writeln("\n-Cnpj do Mercado:"),writeln(Cnpj),
    writeln("-NOME: "),writeln(Nome),
    writeln("------------------"),
    listaCnpjs(T).

