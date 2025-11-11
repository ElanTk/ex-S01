data Item = Item {
    nomeItem     :: String,
    categoria    :: String,
    precoItem    :: Double
} deriving (Show)

data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)



valorTotalItens :: [Item] -> Double
valorTotalItens lista = sum (map precoItem lista)

calculaDesconto :: [Item] -> Double
calculaDesconto lista =
    let total = valorTotalItens lista
    in if total > 200
        then total * 0.10
        else 0

valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
    | total > 200 = total - desconto          -- esse negócio usando | é bizarro de usar, mas até é legalzinho (otherwise é legal)
    | otherwise   = total + 15.0              
    where
        total = valorTotalItens lista
        desconto = calculaDesconto lista

mostrarItens :: [Item] -> String
mostrarItens [] = "Nenhum item comprado."
mostrarItens xs = unlines [ "- " ++ nomeItem i ++ " (" ++ categoria i ++ ") - R$ " ++ show (precoItem i) | i <- xs ]



-- Alguns valores já setados pra teste novamente
espada   = Item "Espada Mestra" "Arma" 250.0
poção    = Item "Fada em uma jarra" "Poção" 40.0
escudo   = Item "Escudo Hyliano" "Equipamento" 180.0
flechas  = Item "Flechas de Fogo" "Arma" 75.0

compra1 = CompraZelda [espada, poção]
compra2 = CompraZelda [escudo]
compra3 = CompraZelda [flechas, poção]
compra4 = CompraZelda []

main :: IO ()
main = do
    putStrLn "Compra 1:"
    putStrLn (mostrarItens (itens compra1))
    putStrLn ("Valor final: R$ " ++ show (valorFinal compra1))
    putStrLn "\n------------------------\n"

    putStrLn "Compra 2:"
    putStrLn (mostrarItens (itens compra2))
    putStrLn ("Valor final: R$ " ++ show (valorFinal compra2))
    putStrLn "\n------------------------\n"

    putStrLn "Compra 3:"
    putStrLn (mostrarItens (itens compra3))
    putStrLn ("Valor final: R$ " ++ show (valorFinal compra3))
    putStrLn "\n------------------------\n"

    putStrLn "Compra 4:"
    putStrLn (mostrarItens (itens compra4))
    putStrLn ("Valor final: R$ " ++ show (valorFinal compra4))