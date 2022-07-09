telaPrincipal :: IO()
telaPrincipal = do
    opcoesMenuInicial
    opcao <- getLine
    usuarioSelecionado opcao


opcoesMenuInicial :: IO()
opcoesMenuInicial = do
    putStrLn("----MERCADO FACIL----")
    putStrLn("\nQual seu tipo de usuario?")
    putStrLn("[1] Cliente")
    putStrLn("[2] Mercado")
    putStrLn("[3] Admin")
    putStrLn("[0] Sair\n")

usuarioSelecionado :: String -> IO()
usuarioSelecionado opcao 
    |opcao == "1" = telaCromprador
    |opcao == "2" = telaSuperMercado
    |opcao == "3" = telaAdmin
    |otherwise = telaSair

------------------------------------------------------------------    
telaCromprador :: IO()
telaCromprador = do
    putStrLn("----MERCADO FACIL|Comprador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Buscar um produto")
    putStrLn("[2] Ver superMercados Disponiveis")
    putStrLn("[3] Buscar SuperMercado mais Economico")
    putStrLn("[0] Sair\n")

------------------------------------------------------------------
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



------------------------------------------------------------------
telaAdmin :: IO()
telaAdmin = do
    putStrLn("----MERCADO FACIL|Administrador|----")
    putStrLn("\nO que deseja fazer?")
    putStrLn("[1] Cadastrar um SuperMercado")
    putStrLn("[2] Cadastrar um Comprador")
    putStrLn("[3] Remover um SuperMercado")
    putStrLn("[4] Remover um Comprador")

    putStrLn("[0] Sair\n")



------------------------------------------------------------------

telaSair :: IO()
telaSair = do
    putStrLn("----Volte sempre ao MERCADO FACIL :D----")

----------------------------------------------------------------------------------

main :: IO()
main = do
    telaPrincipal




