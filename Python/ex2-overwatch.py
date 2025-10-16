from abc import ABC, abstractmethod

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass

    def __str__(self):
        return str(self.nome) + "(" + str(self.funcao) + ")"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(str(self.nome) + " ergue o escudo e se protege... E um poquinho os aliados.")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(str(self.nome) + " dispara faz alguma variacao de um ataque forte!")


def main():

    herois = [
        Tanque("Reinhart"),
        Dano("Tracer"),
        Tanque("Winston"),
        Dano("Cassidy")
    ]

    for heroi in herois:
        print(f"{heroi}:")
        heroi.usar_ultimate()
        print()  


if __name__ == "__main__":
    main()