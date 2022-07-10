module Menus where

import System.IO.Unsafe
import System.Process
import System.Info

opcoesMenuInicial :: IO()
opcoesMenuInicial = do
    putStrLn("----MERCADO FACIL----")
    putStrLn("\nQual seu tipo de usuario?")
    putStrLn("[1] Cliente")
    putStrLn("[2] Mercado")
    putStrLn("[3] Admin")
    putStrLn("[0] Sair\n")


telaCromprador :: IO()
telaCromprador = do
    putStrLn("----MERCADO FACIL|Comprador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Buscar um produto")
    putStrLn("[2] Ver superMercados Disponiveis")
    putStrLn("[3] Buscar SuperMercado mais Economico")
    putStrLn("[0] Sair\n")


telaSuperMercado :: IO()
telaSuperMercado = do
    putStrLn("----MERCADO FACIL|Super-Mercado|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um Produto")
    putStrLn("[2] Buscar um produto")
    putStrLn("[3] Aplicar desconto em Produto")
    putStrLn("[4] Aplicar desconto em Secao")
    putStrLn("[5] Comparar precos")
    putStrLn("[0] Sair\n")


telaAdmin :: IO()
telaAdmin = do
    putStrLn("----MERCADO FACIL|Administrador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um SuperMercado")
    putStrLn("[2] Cadastrar um Comprador")
    putStrLn("[3] Remover um SuperMercado")
    putStrLn("[4] Remover um Comprador")

    putStrLn("[0] Sair\n")   


telaSair :: IO()
telaSair = do
    putStrLn("----Volte sempre ao MERCADO FACIL :D----")