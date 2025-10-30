class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("Metodo 'rastrearLocal()' deve ser implementado!");
  }
}


class Hunter extends IRastreavel {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    super();
    this.#nome = nome;
    this.#localizacao = local;
    this.#idade = idade;
  }

  get nome() {
    return this.#nome;
  }

  get idade() {
    return this.#idade;
  }

  get localizacao() {
    return this.#localizacao;
  }

  rastrearLocal(latitude, longitude) {
      
    this.#localizacao = "Lat: " + latitude + ", Long: " + longitude;
    return `${this.#nome} moveu-se para ${this.#localizacao}`;
  }
}


class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, local, idade, habilidade) {
    super(nome, local, idade);
    this.#habilidadeNen = habilidade;
  }

  rastrearLocal(latitude, longitude) {
    const pos = "Lat: " + latitude + ", Long: " + longitude;
    return `Especialista ${this.nome} usou a habilidade '${this.#habilidadeNen}' para rastrear o local ${pos}.`;
  }
}


class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome, local, idade, alvo = null) {
    super(nome, local, idade);
    this.#alvoAtual = alvo;
  }

  set alvoAtual(hunter) {
    this.#alvoAtual = hunter;
  }

  rastrearLocal(latitude, longitude) {
    const alvo = this.#alvoAtual ? this.#alvoAtual.nome : "nenhum alvo";
    return `Manipulador ${this.nome} esta rastreando ${alvo} nas coordenadas Lat:${latitude}, Long:${longitude}.`;
  }
}


class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    if (!(hunter instanceof Hunter)) {
      console.log("Somente instancias de Hunter podem ser adicionadas!");
      return;
    }

    // evitar duplicatas (mesmo nome)
    for (const h of this.#hunters) {
      if (h.nome === hunter.nome) {
        console.log("O hunter " + hunter.nome + " já está no batalhao!");
        return;
      }
    }

    this.#hunters.add(hunter);
    console.log("Hunter " + hunter.nome + " adicionado ao batalhao com sucesso! ");
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    const relatorio = [];
    console.log("Iniciando rastreamento de todos os Hunters do Batalhao");
    for (const hunter of this.#hunters) {
      relatorio.push(hunter.rastrearLocal(lat, long));
    }
    return relatorio;
  }
}


const gon = new Especialista("Gon Freecss", "Ilha da Baleia", 14, "Jajanken");
const kurapika = new Manipulador("Kurapika", "Yorknew", 17);
const killua = new Especialista("Killua Zoldyck", "Montanha Kukuru", 14, "Deus da Velocidade");
kurapika.alvoAtual = gon;


const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(killua);
batalhao.adicionarHunter(kurapika); // tentativa duplicada


console.log("\nRastreamento em campo:");
const logs = batalhao.iniciarRastreamento("35.6895°N", "139.6917°E");
for (const log of logs) console.log(log);

console.log(`\nNúmero total de Hunters: ${batalhao.getNumHunters()}`);
