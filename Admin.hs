module Admin where

import Mercado

cadastraSuperMercado :: String -> String -> String
cadastraSuperMercado cnpj nome =  Mercado.cadastraMercado cnpj nome
