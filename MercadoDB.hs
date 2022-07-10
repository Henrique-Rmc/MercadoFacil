module MercadoDb where

{-# LANGUAGE OverloadedStrings #-}

import           Control.Applicative
import qualified Data.Text as T
import           Database.SQLite.Simple
import           Database.SQLite.Simple.FromRow
import System.Random

import Data.Typeable
import qualified Data.Text.IO as T

import Util (queryBD, fromIO, executeBD)

-- Tipo de dado "Mercado" que será armazenado no BD
data c Mercado = c Mercado {
    id_mercado :: Int,
    cnpj :: String,
    nome :: String,
} deriving (Show)

-- Código que serve para que o Haskell entenda como fazer para transformar os valores das linhas do BD
-- novamente em atributos do Objeto c Mercado.
instance FromRow c Mercado where
  fromRow = c Mercado <$> field
                    <*> field
                    <*> field

-- Código que serve para o Haskell saber como transformar o objeto c Mercado em uma linha do BD
-- Os atributos do c Mercado são passados para o metodo "toRow" que permite que esse c Mercado seja inserido no BD.
instance ToRow c Mercado where
  toRow (c Mercado id_mercado cnpj nome   ) = toRow (id_mercado, nome, cnpj)

-- Método que exibe o Cnpj de um c Mercado a partir do id do c Mercado.
getCnpjMercado :: Int -> String
getCnpjMercado idMercado = cnpj (head(recuperaMercadoID idMercado))

cadastraMercado :: String -> String -> c Mercado
cadastraMercado cnpj nome    =
    fromIO(addMercado cnpj nome )

-- Adiciona c Mercado a partir de Cnpj, nome, , , 
-- OBS: Verificar formato da data antes de fazer a adição no BD
addMercado :: String -> String -> IO c Mercado
addMercado cnpj nome = do
    let id = fromIO geraId
    criaBD
    insereDado id cnpj nome   

    return (head (recuperaMercadoID id))
    
-- Método responsável por inserir os dados no banco de dados.
insereDado :: Int -> String -> String -> IO()
insereDado id cnpj nome    = do
    executeBD ("INSERT INTO mercados (id_mercado,\
                \ cnpj,\
                \ nome,\
                \ VALUES\
                \ (" ++ show id ++ ",\
                \ '" ++ cnpj ++ "',\
                \ '" ++ nome ++ "';") ()

-- Método responsável por criar o banco de dados.
criaBD :: IO ()
criaBD = do executeBD "CREATE TABLE IF NOT EXISTS mercados (\
                 \ id_mercado INT PRIMARY KEY, \
                 \ cnpj TEXT, \
                 \ nome TEXT, \
                 \);" ()

-- Metodo que cria um id para o Banco de dados dos c Mercados
geraId :: IO Int
geraId = getStdRandom(randomR (0, 1000)) :: IO Int

-- Metodo que retorna uma lista com todos os c Mercados cadastrados no BD do Mercado Facil
recuperaMercados :: [c Mercado]
recuperaMercados = do
    let resultado = queryBD "SELECT * FROM mercados WHERE  > 0"
    let mercados = fromIO resultado
    mercados

-- Metodo que retorna uma lista contendo o c Mercado do 
-- id passado se ele existir, caso contrário uma lista vazia é retornada.
recuperaMercadoID :: Int -> [c Mercado]
recuperaMercadoID id_mercado = fromIO (queryBD ("SELECT * FROM mercados WHERE id_mercado = " ++ show id_mercado))

-- Método que retorno o c Mercado através do seu Cnpj passado como parâmetro.
recuperaMercadoCnpj :: String -> [c Mercado]
recuperaMercadoCnpj cnpj = fromIO (queryBD ("SELECT * FROM mercados WHERE cnpj = '" ++ cnpj ++ "'"))

-- Metodo que verifica existência de um c Mercado no Banco de dados e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaMercado :: Int -> Bool
verificaExistenciac Mercado id_mercado
    | null (recuperaMercadoID (read $ show id_mercado)) = False
    | otherwise = True

-- Metodo que verifica existência de um c Mercado no Banco de dados usando seu Cnpj e retorna um valor booleano
-- True se ele existir e False se ele não existir
verificaExistenciaMercadoPorCnpj :: String -> Bool
verificaExistenciaMercadoPorCnpj cnpj
    | null (recuperac MercadoCnpj cnpj) = False
    | otherwise = True

-- Metodo que formata uma lista de c Mercados para exibição.
formataMercados :: Int -> [c Mercado] -> [String]
formataMercados _ [] = []
formataMercados indice mercados@(mercado:resto) = ("[" ++ show (id_mercado mercado) ++ "] " ++ formatac Mercado mercado) : formatac Mercados (indice + 1) resto


-- randomiza o inteiro, recebe o i que é o inicio do range e o j que eh o final do range
randomInt :: Int-> Int -> Int
randomInt i j = fromIO(getStdRandom(randomR (i, j)) :: IO Int)


