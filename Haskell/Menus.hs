{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
module Menus where

--import Util

--import System.IO.Unsafe
--import System.Process
--import System.Info

opcoesMenuInicial :: IO()
opcoesMenuInicial = do
    putStrLn("----MERCADO FACIL----")
    putStrLn("\nQual seu tipo de usuario?")
    putStrLn("[1] Cliente")
    putStrLn("[2] Mercado")
    putStrLn("[3] Administrador")
    putStrLn("[0] Sair\n")


---------------------MENU COMPRADOR---------------------------------------------


telaComprador :: IO()
telaComprador = do
    putStrLn("----MERCADO FACIL|Comprador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Buscar um produto por Nome")
    putStrLn("[2] Ver Mercados Disponiveis")
    putStrLn("[3] XXXBuscar Mercado mais EconomicoXXX")
    putStrLn("[4] Buscar produtos por Mercado")
    putStrLn("[0] Sair\n")

solicitaNomeProduto :: IO()
solicitaNomeProduto = do
    putStrLn("Insira o nome do produto desejado\n")

produtosCadastrados :: IO()
produtosCadastrados = do
    putStrLn("Lista de Todos os Produtos cadastrados\n")


---------------------MENU MERCADO---------------------------------------------

telaMercado :: IO()
telaMercado = do
    putStrLn("----MERCADO FACIL|Mercado|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um Produto")
    putStrLn("[2] Listar Meus Produtos")
    putStrLn("[3] XXXXAplicar desconto em ProdutoXXXX")
    putStrLn("[4] XXXXAplicar desconto em SecaoXXXX")
    putStrLn("[5] Comparar precos")
   
    putStrLn("[0] Sair\n")

cadastraProduto :: IO()
cadastraProduto = do
    putStrLn("Insira o cnpj do seu Estabelecimento\n")

cadastraNomeProduto :: IO()
cadastraNomeProduto = do
    putStrLn("Insira o nome do seu Produto\n")

cadastraValorProduto :: IO()
cadastraValorProduto = do
    putStrLn("Insira o valor do seu Produto\n")

cadastraMarcaProduto :: IO()
cadastraMarcaProduto = do
    putStrLn("Insira a marca do seu Produto\n")

cadastraValidadeProduto :: IO()
cadastraValidadeProduto = do
    putStrLn("Insira o ano de validade do seu Produto\n")

cadastraCategoriaProduto :: IO()
cadastraCategoriaProduto = do
    putStrLn("Insira a categoria do seu Produto\n")

cadastraQuantidadeProduto :: IO()
cadastraQuantidadeProduto = do
    putStrLn("Insira a quantidade do seu Produto\n")


---------------------MENU ADMIN---------------------------------------------

opcoesMenuAdmin :: IO()
opcoesMenuAdmin = do
    putStrLn("----MERCADO FACIL|Administrador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um Mercado")
    putStrLn("[2] Cadastrar um Cliente")
    putStrLn("[3] Remover um Mercado")
    putStrLn("[4] Remover um Cliente")
    putStrLn("[5] Listar Mercados")
    putStrLn("[6] Listar Clientes")
    putStrLn("[0] Sair\n")   


---------------------MENU ADMIN MERCADO---------------------------------------------

cadastrarNomeMercado :: IO()
cadastrarNomeMercado = do
    putStrLn("\n-----CADASTRE O NOME-----")


cadastrarCnpj :: IO()
cadastrarCnpj = do
    putStrLn("\n-----CADASTRE O CNPJ-----")

---------------------MENU ADMIN CLIENTE---------------------------------------------
cadastrarNomeCliente :: IO()
cadastrarNomeCliente = do
    putStrLn("\n-----CADASTRE O NOME-----")


cadastrarCpf :: IO()
cadastrarCpf = do
    putStrLn("\n-----CADASTRE O CPF-----")


------------------------------------------------------------------------------------

nomeProdutoInvalido :: IO()
nomeProdutoInvalido = do
    putStrLn("Esse Produto não consta em nosso Sistema, tente novamente\n")

solicitaCnpj :: IO()
solicitaCnpj = do
    putStrLn("Insira o cnpj do seu Estabelecimento\n")

operacaoSucesso :: IO()
operacaoSucesso = do
    putStrLn("\n-----OPERAÇÃO REALIZADA COM SUCESSO-----\n")

cnpjInvalido :: IO()
cnpjInvalido = do
    putStrLn("\n-----NÃO EXISTE NENHUM MERCADO COM O CNPJ PASSADO-----\n")

cnpjJaExiste :: IO()
cnpjJaExiste = do
    putStrLn("\n-----JÁ EXISTE UM MERCADO COM O CNPJ CADASTRADO-----\n")


telaSair :: IO()
telaSair = do
    putStrLn("----Volte sempre ao MERCADO FACIL :D----")