class Personagem:
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    def get_vida(self):
        return self._vida

    def set_vida(self, valor):
        if valor < 0:
            self._vida = 0
        else:
            self._vida = valor

    def __str__(self):
        return "Personagem com " + str(self._vida) + " de vida e " + str(self._resistencia) + " de resistência."


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "pesada" if self.armadura_pesada else "leve"
        return ("Cavaleiro com " + str(self._vida) + " de vida, " + str(self._resistencia) + " de resistência e armadura " + str(tipo_armadura))

def main():
    print("=== Demonstração das classes Personagem e Cavaleiro ===\n")

    p1 = Personagem(100, 50)
    print(p1)

    p1.set_vida(p1.get_vida() - 30)
    print(p1)

    p1.set_vida(p1.get_vida() - 200)
    print(p1)

    c1 = Cavaleiro(150, 80, True)
    print(c1)

    c1.set_vida(c1.get_vida() - 70)
    print(c1)

    c1.set_vida(c1.get_vida() + 50)
    print(c1)


if __name__ == "__main__":
    main()