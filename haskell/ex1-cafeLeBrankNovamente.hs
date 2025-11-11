data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Float
} deriving (Show)

data Status = Aberto | Entregue | Cancelado
    deriving (Show, Eq)

data Pedido = Pedido {
    bebidas :: [Bebida],
    status  :: Status
} deriving (Show)



valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido bs st) =
    if st == Cancelado
        then 0
        else sum (map preco bs) + 5.0
        
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido bs _) =
    if null bs
        then "Nenhuma bebida neste pedido."
        else nome (head bs)

mostrarPedido :: Pedido -> String
mostrarPedido (Pedido bs st) =
    let nomes = if null bs then "Nenhuma bebida" else unwords (map nome bs)
        total = valorTotalPedido (Pedido bs st)
    in "Status: " ++ show st ++
       "\nBebidas: " ++ nomes ++
       "\nTotal: R$ " ++ show total



-- exemplos pro teste
cafe  = Bebida "Café Leblanc" "Café" 7.5
cha   = Bebida "Chá Verde" "Chá" 6.0
suco  = Bebida "Suco de Laranja" "Suco" 8.0

pedido1 = Pedido [cafe, cha] Aberto
pedido2 = Pedido [suco] Entregue
pedido3 = Pedido [] Cancelado

main :: IO ()
main = do
    putStrLn "\nPedido 1:"
    putStrLn (mostrarPedido pedido1)
    putStrLn ("\nPrimeira bebida: " ++ primeiraBebida pedido1)

    putStrLn "\n------------------------"

    putStrLn "\nPedido 2:"
    putStrLn (mostrarPedido pedido2)
    putStrLn ("\nPrimeira bebida: " ++ primeiraBebida pedido2)

    putStrLn "\n------------------------"

    putStrLn "\nPedido 3:"
    putStrLn (mostrarPedido pedido3)
    putStrLn ("\nPrimeira bebida: " ++ primeiraBebida pedido3)