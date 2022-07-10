module Mercado where

import MercadoDB
--import ProdutoDB 
--import Produto

--criaBDs :: IO()
--criaBDs = do
--   ProdutoDB



cadastraMercado :: String -> String -> String
cadastraMercado nome cnpj
    | MercadoDB.verificaExistenciaMercadoPorCnpj nome = "Erro: mercado já cadastrado!"
    | otherwise = "mercado de id: " ++ show idmercado ++ " cadastrado com sucesso!\n" ++ toString cnpj nome
    where idmercado = id_mercado (MercadoDB.cadastraMercado cnpj nome)

--ProdutoExiste:: Int-> Bool
--ProdutoExiste idProduto = ProdutoDB.verificaExistenciaProduto idProduto

--ProdutoDisponivel:: Int-> Bool
--ProdutoDisponivel idProduto = (ProdutoDB.recuperaEstoqueProduto idProduto > 0)


--decrementaProduto :: Int -> String
--decrementaProduto id = Produto.decrementa id

--recuperaNomeProduto:: Int-> String
--recuperaNomeProduto idProduto = ProdutoDB.getNomeProduto idProduto


--cadastraProduto :: String -> String -> String -> String -> Int -> String
--cadastraProduto nome marca dataValidade categoria quantidade =
    --Produto.cadastraProduto nome marca dataValidade categoria quantidade

--addEstoqueProduto :: Int -> Int -> String
--addEstoqueProduto id quantidade = Produto.addEstoqueProduto id quantidade

--recuperaProdutos :: String
--recuperaProdutos = Produto.recuperaProdutos

--verificaDisponibilidade :: Int -> String 
--verificaDisponibilidade id = Produto.verificaDisponibilidade id

--listaProdutos :: String
--listaProdutos = Produto.listaProdutos