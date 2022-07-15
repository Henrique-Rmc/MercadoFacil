{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant ==" #-}
module Util where
import System.IO
import Data.List 

import qualified Data.Text as T

--lê a String e retorna o que foi lido
lerString :: IO String
lerString = do
    x <- getLine
    return x

--O Método geraLista recebe uma String e uma Lista de Listas de Strings que 
geraLista :: String -> [[String]] -> [[String]]
geraLista _ [] = []
geraLista n (x:xs) | (aux n x) == True = geraLista n xs
                   | otherwise = x:geraLista n xs             
                   
                   
--O Método geraLista recebe uma String e uma Lista de Listas de Strings que 
geraListaPorNome :: String -> [[String]] -> [[String]]
geraListaPorNome _ [] = []
geraListaPorNome n (x:xs) | (auxProduto n (x !! 1)) == False = geraListaPorNome n xs
                   | otherwise = x:geraListaPorNome n xs   

--Recebe uma String e uma Lista de Strings.Compara a String com cada elemento da Lista inserindo-os em uma nova lista caso não sejam a String passada
geraNovaLista :: String -> [[String]] -> [[String]]
geraNovaLista _ [] = []
geraNovaLista n (x:xs) | (aux n x) == False = geraNovaLista n xs
                   | otherwise = x:geraNovaLista n xs

--Um método que serve de Auxilio em métodos comparativos. Essa estrutura recebe uma String e uma lista de 1 String, compara ambas e retorna se é True ou False
aux:: String -> [String] -> Bool
aux n (x:xs) = (n == x)


auxProduto:: String -> String -> Bool
auxProduto n x= (n == x )


--Recebe uma String e uma lista de Strings. Valida se a String passada se encontra na lista e retorna True ou False
isValidFull :: String -> [[String]] -> Bool
isValidFull _ [] = False
isValidFull n (x:xs) | ((auxProduto n (x!!1)) == False) = isValidFull n xs
                   | otherwise = True


--Recebe uma String e uma lista de Strings. Valida se a String passada se encontra na lista e retorna True ou False
isValid :: String -> [[String]] -> Bool
isValid _ [] = False
isValid n (x:xs) | ((aux n x) == False) = isValid n xs
                   | otherwise = True


--Metodos GetListTxt geram a lista txt que vai ser usada para substituir a lista inicial da qual removemos o elemento desejado
-----------------------------------------------------------------
getListaMercadosTxt :: [[String]] -> String
getListaMercadosTxt [] = ""
getListaMercadosTxt (x:xs) = "Cnpj:" ++ head x ++ " Nome:" ++ (x !! 1) ++ "\n" ++ getListaMercadosTxt xs



getListaProdutosTxt :: [[String]] -> String
getListaProdutosTxt [] = ""
getListaProdutosTxt (x:xs) = head x ++ "," ++ (x !! 1) ++ "," ++ (x !! 2) ++ "," ++ (x !! 3) ++ "," ++ (x !! 4) ++ "," ++ (x !! 5) ++ "\n" ++ getListaProdutosTxt xs




-----------------------------------------------------------------


--Métodos Subscreve servem para limpar o arquivo TXT que pretendemos alterar para inserirmos os novos métodos
-----------------------------------------------------------------
subrescreveHeadCliente :: String -> IO()
subrescreveHeadCliente h = do
    arq <- openFile "data/clientes.txt" WriteMode
    hPutStr arq h
    hFlush arq
    hClose arq


subrescreveHeadMercado :: String -> IO()
subrescreveHeadMercado h = do
    arq <- openFile "data/mercados.txt" WriteMode
    hPutStr arq h
    hFlush arq
    hClose arq

subrescreveShowProducts :: String -> IO()
subrescreveShowProducts h = do
    arq <- openFile "data/showProducts.txt" WriteMode
    hPutStr arq h
    hFlush arq
    hClose arq
-----------------------------------------------------------------

--É uma função que recebe um char e uma String. Quando o Char é encontrado na String ele é quebrado e 
splitLista :: (Char -> Bool) -> String -> [String]
splitLista p s =  case dropWhile p s of
                        "" -> []
                        s' -> w : splitLista p s''
                            where (w, s'') = break p s' 


--Acessa o Txt que contém os dados buscados.
getLines :: Handle -> IO [String]
getLines m = hGetContents m >>= return . lines