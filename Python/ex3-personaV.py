class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return "Arma: " + str(self.nome) + " Dano: " + str(self.dano)


class PhantomThieves:
    def __init__(self, nome: str, arma: ArmaCorpoACorpo):
        self.nome = nome
        self.arma = arma 

    def __str__(self):
        return str(self.nome) + " - " + str(self.arma)


class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        self.arma = ArmaCorpoACorpo("duas pistolas (corpo a corpo)", 80)

        self.equipe = equipe

    def mostrar_equipe(self):
        print("Líder: Joker - " + str(self.arma))

        for membro in self.equipe:
            print(membro)


def main():
    arma1 = ArmaCorpoACorpo("steel pipe (sfx)", 65)
    arma2 = ArmaCorpoACorpo("unhas, sla", 55)
    arma3 = ArmaCorpoACorpo("literalmente uma moto", 270)

    membro1 = PhantomThieves("Skull", arma1)
    membro2 = PhantomThieves("Mona", arma2)
    membro3 = PhantomThieves("Queen", arma3)

    joker = Joker([membro1, membro2, membro3])

    joker.mostrar_equipe()


if __name__ == "__main__":
    main()