from abc import ABC, abstractmethod
from typing import List, Optional


class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self) -> None:
        pass


class Implante:
    def __init__(self, custo: float, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return "Implante(funcao: " + str(self.funcao) + ", custo: " + str(self.custo) + ")"


class NetRunner(Cibernetico):
    """NetRunner compõe internamente um Implante."""
    def __init__(self, nome: str, custo_implante: float, funcao_implante: str):
        self.nome = nome
        # Composição: NetRunner cria e gerencia seu próprio Implante
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self) -> None:
        print( str(self.nome) + " inicia o hack usando seu " + str(self.implante.funcao) + " (custo do implante: " + str(self.implante.custo) + ")")

    def __str__(self):
        return "NetRunner " + str(self.nome) + " - " + str(self.implante)


class Faccao:
    def __init__(self, membros: Optional[List[Cibernetico]] = None):
        self.membros: List[Cibernetico] = membros if membros is not None else []

    def adicionar_membro(self, membro: Cibernetico) -> None:
        self.membros.append(membro)

    def executar_hacks(self) -> None:
        if not self.membros:
            print("Nenhum membro na facção.")
            return
        for i, membro in enumerate(self.membros, start=1):
            print("\n[" + str(i) + "]" + str(membro))
            membro.realizar_hack()


def main():
    homens_de_branco = Faccao()

    nr1 = NetRunner("Marcos", 1200.0, "Infiltrar sistema operacional")
    nr2 = NetRunner("Carlos", 800.5, "Desativar camera")
    nr3 = NetRunner("Jeremias", 950.0, "Bypass de firewalls do seu coracao")

    homens_de_branco.adicionar_membro(nr1)
    homens_de_branco.adicionar_membro(nr2)
    homens_de_branco.adicionar_membro(nr3)

    homens_de_branco.executar_hacks()


if __name__ == "__main__":
    main()