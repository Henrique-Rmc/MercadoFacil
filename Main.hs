--import Admin

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
opcoesMenuInicial :: IO()
opcoesMenuInicial = do
    putStrLn("----MERCADO FACIL----")
    putStrLn("\nQual seu tipo de usuario?")
    putStrLn("[1] Cliente")
    putStrLn("[2] Mercado")
    putStrLn("[3] Admin")
    putStrLn("[0] Sair\n")

cmdPrincipal :: IO()
cmdPrincipal = do
    opcoesMenuInicial
    opcao <- getLine
    usuarioSelecionado opcao


usuarioSelecionado :: String -> IO()
usuarioSelecionado opcao 
    |opcao == "1" = telaCromprador
    |opcao == "2" = telaSuperMercado
    |opcao == "3" = cmdAdmin
    |otherwise = telaSair

----------------------MENU COMPRADOR--------------------------------------------    
telaCromprador :: IO()
telaCromprador = do
    putStrLn("----MERCADO FACIL|Comprador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Buscar um produto")
    putStrLn("[2] Ver superMercados Disponiveis")
    putStrLn("[3] Buscar SuperMercado mais Economico")
    putStrLn("[0] Sair\n")
----------------------MENU MERCADO--------------------------------------------
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

---------------------MENU ADMIN---------------------------------------------

opcoesMenuAdmin :: IO()
opcoesMenuAdmin = do
    putStrLn("----MERCADO FACIL|Administrador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um SuperMercado")
    putStrLn("[2] Cadastrar um Comprador")
    putStrLn("[3] Remover um SuperMercado")
    putStrLn("[4] Remover um Comprador")
    putStrLn("[0] Sair\n")   

cmdAdmin :: IO()
cmdAdmin = do
    opcoesMenuAdmin
    opcaoAdm <- getLine
    print opcaoAdm
--    adminSelecionado opcaoAdm

--adminSelecionado :: String -> IO()
--adminSelecionado opcaoAdm
--    |opcao == "1" = Admin.cadastraCliente
--    |opcao == "2" = Admin.cadastraSuperMercado
--    |opcao == "3" = removeSuperMercado
--    |opcao == "2" = removeCromprador
--    |otherwise = telaSair



--selecaoAdmin :: String -> IO()
--selecaoAdmin opcao 
--   |opcao == "1" = cadastraSuperMercado
--    |opcao == "2" = cadastraComprador
--    |pcao == "3" = removeSuperMercado
--    |opcao == "4" = removeComprador
--    |opcao == "4" = listaMercados
--    |opcao == "4" = listaCompradores
 --   |otherwise = telaSair


------------------------------------------------------------------
telaSair :: IO()
telaSair = do
    putStrLn("----Volte sempre ao MERCADO FACIL :D----")
----------------------------------------------------------------------------------

main :: IO()
main = do
    cmdPrincipal




