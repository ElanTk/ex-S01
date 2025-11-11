data Servico = Servico {
    nomeServico  :: String,
    tipoServico  :: String,
    precoServico :: Double
} deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAt :: StatusAtendimento
} deriving (Show)



bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss =
    let totalBase = sum (map precoServico ss)
        totalComBonus = if length ss > 3
                           then totalBase * 1.25
                           else totalBase
        totalComDesconto = if totalComBonus > 500
                              then totalComBonus * 0.90 
                              else totalComBonus
    in totalComDesconto

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento ss st)
    | st == Cancelado = 0.0
    | otherwise       = bonusEspiritual ss

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento ss _) =
    if null ss
       then "Nenhum serviço registrado neste atendimento."
       else let s = head ss
            in "Primeiro serviço: " ++ nomeServico s ++ " (" ++ tipoServico s ++ ")"

mostrarServicos :: [Servico] -> String
mostrarServicos [] = "Nenhum serviço."
mostrarServicos xs = unlines [ "- " ++ nomeServico s ++ " (" ++ tipoServico s ++ ") - R$ " ++ show (precoServico s) | s <- xs ]



-- Exemplos pra testes
banhoSimples   = Servico "Banho Foda" "Banho" 80.0
massagemLeve   = Servico "Massagem Padrão" "Massagem" 120.0
banqueteRitual = Servico "Banquete Ritual" "Banquete" 220.0
banhoLuxo      = Servico "Banho Ainda Mais Foda" "Banho" 200.0
pacoteCompleto = Servico "Pacote Completo" "Banho+Massagem+Banquete" 350.0

atendimento1 = Atendimento [banhoSimples, massagemLeve] EmAndamento
atendimento2 = Atendimento [banhoLuxo, banqueteRitual, massagemLeve, banhoSimples] Finalizado

atendimento3 = Atendimento [pacoteCompleto] Cancelado
atendimento4 = Atendimento [] EmAndamento

main :: IO ()
main = do
    putStrLn "Atendimento 1 (Em Andamento):"
    putStrLn (mostrarServicos (servicos atendimento1))
    putStrLn (descricaoPrimeiroServico atendimento1)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento atendimento1))
    putStrLn "\n------------------------\n"

    putStrLn "Atendimento 2 (Finalizado):"
    putStrLn (mostrarServicos (servicos atendimento2))
    putStrLn (descricaoPrimeiroServico atendimento2)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento atendimento2))
    putStrLn "\n------------------------\n"

    putStrLn "Atendimento 3 (Cancelado):"
    putStrLn (mostrarServicos (servicos atendimento3))
    putStrLn (descricaoPrimeiroServico atendimento3)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento atendimento3))
    putStrLn "\n------------------------\n"

    putStrLn "Atendimento 4 (Lista vazia):"
    putStrLn (mostrarServicos (servicos atendimento4))
    putStrLn (descricaoPrimeiroServico atendimento4)
    putStrLn ("Valor final: R$ " ++ show (valorFinalAtendimento atendimento4))