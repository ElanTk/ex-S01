
class Pokemon {
  #vida;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) this.#vida = 0;
    console.log(`${this.nome} recebeu ${dano} de dano. Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} ataca genericamente ${alvo.nome}!`);
    alvo.receberDano(10);
  }
}


class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonus;
  }

  atacar(alvo) {
    const dano = 15 + this.bonusAtaque;
    console.log(`${this.nome} lança uma labareda em ${alvo.nome}, causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}


class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    const dano = 12;
    console.log(`${this.nome} dispara um jato d’água em ${alvo.nome}, causando ${dano} de dano!`);
    alvo.receberDano(dano);
    console.log(`${this.nome} dispara outro jato d’água em ${alvo.nome}, causando ${dano} de dano!`);
    alvo.receberDano(dano);
  }
}

// Aqui a gente simula uma mini batalha só pra ver se esta funcionando.

const charmander = new PokemonFogo("Charmander", 100, 5);
const squirtle = new PokemonAgua("Squirtle", 100, 8);

console.log("Inicio da batalha teste.");
charmander.atacar(squirtle);
squirtle.atacar(charmander);
charmander.atacar(squirtle);
squirtle.atacar(charmander);
console.log("Fim da batalha teste.");


console.log("");
console.log(charmander.nome + " tem " + charmander.getVida() + " de vida restante.");
console.log(squirtle.nome + " tem " + squirtle.getVida() + " de vida restante.");