module Util where

import System.IO.Unsafe
import Database.SQLite.Simple



executeBD :: ToRow q => String -> q -> IO ()
executeBD acao propriedades = do
   conn <- open "./data/mercadoFacil.db"
   let pesquisa = read $ show acao :: Query
   execute conn pesquisa propriedades
   close conn

   
queryBD :: FromRow r => String -> IO [r]
queryBD query = do
   conn <- open "./data/mercadoFacil.db"
   let pesquisa = read $ show query :: Query;
   query_ conn pesquisa;


lerEntradaString :: IO String
lerEntradaString = do
         x <- getLine
         return x


ehNumero :: String -> Bool
ehNumero valor
   | length valor == 0 = False
   | otherwise = all (`elem` ['0'..'9']) valor

ehQuantidadeValida :: String -> Bool
ehQuantidadeValida valor
   |valor == "0" = False
   | otherwise = ehNumero valor

fromIO :: IO a -> a
fromIO = unsafePerformIO

