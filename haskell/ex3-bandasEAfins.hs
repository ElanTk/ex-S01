data Banda = Banda {
    nomeBanda :: String,
    genero    :: String,
    cache     :: Double
} deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento {
    bandas :: [Banda],
    status :: StatusEvento
} deriving (Show)



custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento bs st) =
    if st == Cancelado
        then 0.0
        else
            let totalCashes = sum (map cache bs)
                taxaProducao = totalCashes * 0.20
            in totalCashes + taxaProducao

bandaAbertura :: Evento -> String
bandaAbertura (Evento bs _) =
    if null bs
        then "Nenhuma banda de abertura definida."
        else "Banda de abertura: " ++ nomeBanda (head bs)

bandaEncerramento :: Evento -> String
bandaEncerramento (Evento bs _) =
    if null bs
        then "Nenhuma banda de encerramento definida."
        else "Banda de encerramento: " ++ nomeBanda (last bs)

mostrarBandas :: [Banda] -> String
mostrarBandas [] = "Nenhuma banda cadastrada."
mostrarBandas xs = unlines [ "- " ++ nomeBanda b ++ " (" ++ genero b ++ ") - Cache: R$ " ++ show (cache b) | b <- xs ]



-- Exemplos pro main pra testar e etc
b1 = Banda "Os canos caidos" "Rock" 150.0
b2 = Banda "Orpheus e Eurydice" "Pop" 180.0
b3 = Banda "Vask e Amigos" "Jazz" 200.0
b4 = Banda "Daft Punk 2" "Eletrônico" 250.0
b5 = Banda "O som da Morte" "Metal" 300.0

eventoAtivo     = Evento [b1, b2, b3] Ativo
eventoEncerrado = Evento [b4, b5] Encerrado
eventoCancelado = Evento [b1, b5, b3] Cancelado

-- Função principal
main :: IO ()
main = do
    putStrLn "Evento Ativo:"
    putStrLn (mostrarBandas (bandas eventoAtivo))
    putStrLn (bandaAbertura eventoAtivo)
    putStrLn (bandaEncerramento eventoAtivo)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoAtivo))
    putStrLn "\n------------------------\n"

    putStrLn "Evento Encerrado:"
    putStrLn (mostrarBandas (bandas eventoEncerrado))
    putStrLn (bandaAbertura eventoEncerrado)
    putStrLn (bandaEncerramento eventoEncerrado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoEncerrado))
    putStrLn "\n------------------------\n"

    putStrLn "Evento Cancelado:"
    putStrLn (mostrarBandas (bandas eventoCancelado))
    putStrLn (bandaAbertura eventoCancelado)
    putStrLn (bandaEncerramento eventoCancelado)
    putStrLn ("Custo total: R$ " ++ show (custoTotalEvento eventoCancelado))