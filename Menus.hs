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
    putStrLn("[1] Buscar um produto")
    putStrLn("[2] Ver Mercados Disponiveis")
    putStrLn("[3] Buscar Mercado mais Economico")
    putStrLn("[0] Sair\n")


---------------------MENU MERCADO---------------------------------------------

telaMercado :: IO()
telaMercado = do
    putStrLn("----MERCADO FACIL|Super-Mercado|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um Produto")
    putStrLn("[2] Buscar um produto")
    putStrLn("[3] Aplicar desconto em Produto")
    putStrLn("[4] Aplicar desconto em Secao")
    putStrLn("[5] Comparar precos")
    putStrLn("[0] Sair\n")

---------------------MENU ADMIN---------------------------------------------

opcoesMenuAdmin :: IO()
opcoesMenuAdmin = do
    putStrLn("----MERCADO FACIL|Administrador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um Mercado")
    putStrLn("[2] Cadastrar um Cliente")
    putStrLn("[3] Remover um Mercado")
    putStrLn("[4] Remover um Cliente")
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

operacaoSucesso :: IO()
operacaoSucesso = do
    putStrLn("\n-----OPERAÇÃO REALIZADA COM SUCESSO-----\n")


telaSair :: IO()
telaSair = do
    putStrLn("----Volte sempre ao MERCADO FACIL :D----")