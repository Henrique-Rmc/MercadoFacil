module Util where
import System.IO
import Data.List 

lerString :: IO String
lerString = do
    x <- getLine
    return x

--opVaga
geraLista :: String -> [[String]] -> [[String]]
geraLista _ [] = []
geraLista v (x:xs) | (aux v x) == True = geraLista v xs
                   | otherwise = x:geraLista v xs

aux :: String -> [String] -> Bool
aux v (x:xs) = (v == x)

--primeira
getHead :: [[String]] -> String
getHead [] = ""
getHead (x:xs) = head x ++ "," ++ (x !! 1) ++ "\n" ++ getHead xs


--- FUNÇÕES QUE ESCREVEM NO ARQUIVO ---
subrescreveHeadCliente :: String -> IO()
subrescreveHeadCliente h = do
    arq <- openFile "data/clientes.txt" WriteMode
    hPutStr arq h
    hFlush arq
    hClose arq


subrescreveHeadMercado :: String -> IO()
subrescreveHeadMercado n = do

    arq <- openFile "data/mercados.txt" WriteMode
    hPutStr arq n
    hFlush arq
    hClose arq



splitLista :: (Char -> Bool) -> String -> [String]
splitLista p s =  case dropWhile p s of
                        "" -> []
                        s' -> w : splitLista p s''
                            where (w, s'') = break p s' 