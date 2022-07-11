module Util where
import System.IO
import Data.List 

lerString :: IO String
lerString = do
    x <- getLine
    return x

geraLista :: String -> [[String]] -> [[String]]
geraLista _ [] = []
geraLista n (x:xs) | (aux n x) == True = geraLista n xs
                   | otherwise = x:geraLista n xs

aux :: String -> [String] -> Bool
aux a (x:xs) = (a == x)


getHead :: [[String]] -> String
getHead [] = ""
getHead (x:xs) = head x ++ "," ++ (x !! 1) ++ "\n" ++ getHead xs


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



splitLista :: (Char -> Bool) -> String -> [String]
splitLista p s =  case dropWhile p s of
                        "" -> []
                        s' -> w : splitLista p s''
                            where (w, s'') = break p s' 