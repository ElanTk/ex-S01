class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}


class Diario {
  #autorSecreto;
  enigmas;
  criaturasAvistadas;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  adicionarEncontroCriatura(criatura) {
    this.criaturasAvistadas.push(criatura);
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Chave incorreta.";
    }

    if (!this.enigmas.has(num)) {
      return "Enigma nao encontrado.";
    }

    return "Enigma " + num + " decodificado: " + this.enigmas.get(num) + ". Nao me pergunte o que o enigma diz.";
  }
}


class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}


class Protagonista extends Personagem {
  constructor(nome, idade) {
    super(nome, idade);
    this.diario = new Diario('Stanford Pines');
  }
}


class CabanaMisterio {
  constructor(diario) {
    this.visitantes = [];
    this.diario = diario;
    this.funcionarios = [];
  }

  adicionarFuncionario(personagem) {
    if (personagem instanceof Personagem) {
      this.funcionarios.push(personagem);
    } else {
      console.log("Somente personagens podem ser adicionados como funcionarios!");
    }
  }

  listarFuncionarios() {
    return this.funcionarios;
  }
}

// MAIN (pra testar e tals)

const criatura1 = new Criatura("Schmebulock", false);
const criatura2 = new Criatura("Bill Cipher", true);

const dipper = new Protagonista("Dipper Pines", 13);
dipper.diario.adicionarEnigma(1, "Existe um outro livro.");
dipper.diario.adicionarEnigma(2, "Quem escreveu os livros?");
dipper.diario.adicionarEncontroCriatura(criatura1);
dipper.diario.adicionarEncontroCriatura(criatura2);

const cabana = new CabanaMisterio(dipper.diario);
const mabel = new Personagem("Mabel Pines", 13);
const stan = new Personagem("Stanley Pines", 60);

cabana.adicionarFuncionario(dipper);
cabana.adicionarFuncionario(mabel);
cabana.adicionarFuncionario(stan);


console.log(dipper.diario.decodificar("Stanford Pines", 1));
console.log(dipper.diario.decodificar("senhaErrada", 2));

console.log("\nListando funcionarios da Cabana do Misterio=");
const lista = cabana.listarFuncionarios();
lista.forEach(p => console.log("- " + p.nome + ", " + p.idade + " anos"));

console.log("\n Listando Criaturas");
dipper.diario.criaturasAvistadas.forEach(c => {
  console.log(`- ${c.nome} (Perigosa: ${c.perigosa ? "sim" : "nao"})`); // prefiro deixar  "a" + etc ...,  mas ficou melhor desse jeito pra botar sim ou nao.
});
