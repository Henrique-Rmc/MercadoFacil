module Util where
import System.IO
import Data.List 

import qualified Data.Text as T

--lê a String e retorna o que foi lido
lerString :: IO String
lerString = do
    x <- getLine
    return x

--Cria uma nova lista removendo o item desejado
geraLista :: String -> [[String]] -> [[String]]
geraLista _ [] = []
geraLista n (x:xs) | (aux n x) == True = geraLista n xs
                   | otherwise = x:geraLista n xs

aux :: String -> [String] -> Bool
aux a (x:xs) = (a == x)


--Gera a lista txt que vai ser usada para substituir a lista inicial da qual removemos o elemento desejado
getHead :: [[String]] -> String
getHead [] = ""
getHead (x:xs) = head x ++ "," ++ (x !! 1) ++ "\n" ++ getHead xs

--Sobrescreve o Arquivo existente com o novo arquivo gerado
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


splitLista :: (Char -> Bool) -> String -> [String]
splitLista p s =  case dropWhile p s of
                        "" -> []
                        s' -> w : splitLista p s''
                            where (w, s'') = break p s' 


--
isValid :: String -> [[String]] -> Bool
isValid _ [] = False
isValid n (x:xs) | ((auxComp n x) == False) = isValid n xs
                   | otherwise = True



auxComp :: String -> [String] -> Bool
auxComp n (x:xs) = (n == x)



--Cria uma nova lista removendo o item desejado
geraNovaLista :: String -> [[String]] -> [[String]]
geraNovaLista _ [] = []
geraNovaLista n (x:xs) | (aux n x) == False = geraNovaLista n xs
                   | otherwise = x:geraNovaLista n xs





