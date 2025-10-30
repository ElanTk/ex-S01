// ===================== "Interface" IExplorador =====================
class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado!");
  }
}

// ===================== Classe ODM_Gear =====================

class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100; 
  }

  usarGas(quantidade) {
    this.#gasRestante -= quantidade;
    if (this.#gasRestante < 0) this.#gasRestante = 0;
    console.log("[ODM Gear " + this.modelo + "] Gás usado: " + quantidade + ". Restante: " + this.#gasRestante);
  }

  getGas() {
    return this.#gasRestante;
  }
}

// ===================== Classe Soldado =====================

class Soldado extends IExplorador {
  #gear;

  constructor(nome, modeloGear) {
    super(); 
    this.nome = nome;
    this.#gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.#gear.usarGas(10);
    return `${this.nome} está explorando o território com o equipamento ${this.#gear.modelo}.`;
  }

  verificarEquipamento() {
    return `Equipamento do ${this.nome}: ${this.#gear.modelo} | Gás restante: ${this.#gear.getGas()}`;
  }
}

// ===================== Classe Esquadrão =====================

class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    if (!(lider instanceof Soldado)) {
      throw new Error("O líder precisa ser um Soldado que implemente IExplorador!");
    }
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (!(soldado instanceof Soldado)) {
      throw new Error("Somente Soldados que implementam IExplorador podem ser adicionados!");
    }
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    console.log("Esquadrão liderado por " + this.lider.nome + " iniciou a exploração!");
    const relatos = [];
    for (const s of this.membros) {
      relatos.push(s.explorarTerritorio());
    }
    return relatos;
  }

  relatarStatus() {
    const status = [];
    status.push(this.lider.verificarEquipamento());
    for (const s of this.membros) {
      status.push(s.verificarEquipamento());
    }
    return status;
  }
}

// ===================== Demonstração =====================

const eren = new Soldado("Eren", "ODM-MkI");
const mikasa = new Soldado("Mikasa", "ODM-MkII");
const armin = new Soldado("Armin", "ODM-Scout");

const esquadrao = new Esquadrao(eren, [mikasa, armin]);

console.log("=== Início da Exploração ===");
const relatorios = esquadrao.explorarTerritorio();
for (const r of relatorios) console.log(r);

console.log("\n=== Status Atual ===");
const status = esquadrao.relatarStatus();
for (const s of status) console.log(s);