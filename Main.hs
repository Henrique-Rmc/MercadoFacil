
--import Mercado
import Text.Printf
import Menus
import Util
import Data.List 


import System.IO

{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}


cmdPrincipal :: IO()
cmdPrincipal = do
    Menus.opcoesMenuInicial
    opcao <- getLine
    usuarioSelecionado opcao


usuarioSelecionado :: String -> IO()
usuarioSelecionado opcao 
    |opcao == "1" = cmdComprador
    |opcao == "2" = cmdMercado
    |opcao == "3" = cmdAdmin
    |otherwise = Menus.telaSair

----------------------MENU COMPRADOR--------------------------------------------    
cmdComprador :: IO()
cmdComprador = do
    Menus.telaComprador
    opcao <- getLine
    compradorSelecionado opcao

compradorSelecionado :: String -> IO()
compradorSelecionado opcao 
    |opcao == "1" = telaListarProdutosPorNome
    |opcao == "2" = putStrLn("----Listando Mercados----")
    |opcao == "3" = putStrLn("----Buscando Mercado Economico----")
    |otherwise = cmdComprador


telaListarProdutosPorNome :: IO()
telaListarProdutosPorNome = do
    Menus.produtosCadastrados

    file <- openFile "data/produtos.txt" ReadMode
    xs <- Util.getLines file
    let listaTodosProdutos = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    Menus.solicitaNomeProduto
    nomeProduto <- Util.lerString

    if not (Util.isValid nomeProduto listaTodosProdutos)
        then do Menus.nomeProdutoInvalido
                cmdComprador

    else do 
        let produtos = Util.getListaProdutosTxt (Util.geraLista nomeProduto listaTodosProdutos)
        Util.subrescreveShowProducts ""

        appendFile "data/showProducts.txt" (produtos)

        file <- openFile "data/showProducts.txt" ReadMode
        xs <- Util.getLines file
        let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))
        print (lista)
        Menus.operacaoSucesso
        cmdComprador


----------------------MENU MERCADO--------------------------------------------

cmdMercado :: IO()
cmdMercado = do
    Menus.telaMercado
    opcao <- Util.lerString
    mercadoSelecionado opcao

mercadoSelecionado :: String -> IO()
mercadoSelecionado opcao 
    |opcao == "1" = telaCadastraProduto
    |opcao == "2" = telaListarMeusProdutos
    |opcao == "3" = putStrLn("----Aplicar desconto em Produto.....----")
    |opcao == "4" = putStrLn("----Aplicar desconto em Secao....----")
    |opcao == "5" = putStrLn("----Comparar precos....----")
    |otherwise = cmdPrincipal

telaCadastraProduto :: IO()
telaCadastraProduto = do
    Menus.cadastraProduto
    cnpj <- Util.lerString

    file <- openFile "data/mercados.txt" ReadMode
    xs <- Util.getLines file
    let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    if not (Util.isValid cnpj lista)
        then do Menus.cnpjInvalido
                cmdMercado
        
    else do
        Menus.cadastraNomeProduto
        nome <- Util.lerString
        Menus.cadastraValorProduto
        valor <- Util.lerString
        Menus.cadastraMarcaProduto
        marca <- Util.lerString
        Menus.cadastraValidadeProduto
        validade <- Util.lerString
        Menus.cadastraCategoriaProduto
        categoria <- Util.lerString
        Menus.cadastraQuantidadeProduto
        quantidade <- Util.lerString
    

        let produto = cnpj ++ "," ++ nome ++ "," ++ valor ++ "," ++ marca ++ "," ++ validade ++ "," ++ categoria ++ "," ++ quantidade ++ "\n"
        appendFile "data/produtos.txt" (produto)

        Menus.operacaoSucesso
        cmdMercado


telaListarMeusProdutos :: IO()
telaListarMeusProdutos = do
    Menus.solicitaCnpj
    cnpj <- Util.lerString

    file <- openFile "data/mercados.txt" ReadMode
    xs <- Util.getLines file
    let listaMercados = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    if not (Util.isValid cnpj listaMercados)
        then do Menus.cnpjInvalido
                cmdMercado
    else do
        file <- openFile "data/produtos.txt" ReadMode
        xs <- Util.getLines file
        let listaProdutos = ((Data.List.map (Util.splitLista(==',') ) (xs)))

        let produtos = Util.getListaProdutosTxt (Util.geraNovaLista cnpj listaProdutos)
        Util.subrescreveShowProducts ""

        appendFile "data/showProducts.txt" (produtos)

        file <- openFile "data/showProducts.txt" ReadMode
        xs <- Util.getLines file
        let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))
        print (lista)
        Menus.operacaoSucesso

    cmdMercado



---------------------MENU ADMIN---------------------------------------------


cmdAdmin :: IO()
cmdAdmin = do
    Menus.opcoesMenuAdmin
    opcaoAdm <- getLine
    adminSelecionado opcaoAdm

adminSelecionado :: String -> IO()
adminSelecionado opcao
    |opcao == "1" = telaCadastraMercado
    |opcao == "2" = telaCadastraCliente
    |opcao == "3" = telaRemoveMercado
    |opcao == "4" = telaRemoveCliente
    |opcao == "5" = telaListaMercados
    |opcao == "6" = telaListaClientes
    |otherwise = cmdPrincipal

---------------------CADASTRO DE MERCADO---------------------------------------------

telaCadastraMercado :: IO()
telaCadastraMercado = do


    Menus.cadastrarCnpj
    cnpj <- Util.lerString

    file <- openFile "data/mercados.txt" ReadMode
    xs <- getLines file
    let listaMercados = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    if (Util.isValid cnpj listaMercados)
        then do Menus.cnpjJaExiste
                cmdAdmin

    else do
        Menus.cadastrarNomeMercado
        nome <- Util.lerString
    

        let mercado = cnpj ++ "," ++ nome ++ "\n"
        appendFile "data/mercados.txt" (mercado)

        Menus.operacaoSucesso
        cmdAdmin




telaRemoveMercado :: IO()
telaRemoveMercado = do

    file <- openFile "data/mercados.txt" ReadMode
    xs <- Util.getLines file
    let listaMercados = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    putStr("\nEscolha o CNPJ do Mercado cadastrado que deseja remover\n")
    print (listaMercados)
    cnpj <- Util.lerString

    let mercados = Util.getListaMercadosTxt (Util.geraLista cnpj listaMercados)
    Util.subrescreveHeadMercado ""

    appendFile "data/mercados.txt" (mercados)

    Menus.operacaoSucesso

    cmdAdmin


---------------------CADASTRO DE CLIENTE---------------------------------------------
telaCadastraCliente :: IO()
telaCadastraCliente = do
    Menus.cadastrarNomeCliente
    nome <- Util.lerString

    Menus.cadastrarCpf
    cpf <- Util.lerString

    let cliente = cpf ++ "," ++ nome ++ "\n"
    appendFile "data/clientes.txt" (cliente)

    Menus.operacaoSucesso
    cmdAdmin

--REMOVENDO Cliente

telaRemoveCliente :: IO()
telaRemoveCliente = do

    file <- openFile "data/clientes.txt" ReadMode
    xs <- Util.getLines file
    let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))

    putStr("\nEscolha o CPF do Cliente cadastrado que deseja remover\n")
    print (lista)

    cpf <- Util.lerString

    let clientes = Util.getListaMercadosTxt (Util.geraLista cpf lista)
    Util.subrescreveHeadCliente ""

    appendFile "data/clientes.txt" (clientes)

    Menus.operacaoSucesso

    cmdAdmin


---------------------LISTA CLIENTES/MERCADOS-----------------------

telaListaClientes :: IO()
telaListaClientes = do
    putStr("\nLista de Clientes Cadastrados no Sistema\n")
    file <- openFile "data/clientes.txt" ReadMode
    xs <- Util.getLines file
    let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))
    print (lista)
    cmdAdmin


telaListaMercados :: IO()
telaListaMercados = do
    putStr("\nLista de Mercados Cadastrados no Sistema\n")
    file <- openFile "data/mercados.txt" ReadMode
    xs <- Util.getLines file
    let lista = ((Data.List.map (Util.splitLista(==',') ) (xs)))
    print (lista)
    cmdAdmin

----------------------------------------------------------------------------------

main :: IO()
main = do
    cmdPrincipal




