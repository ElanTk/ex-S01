import java.util.*;

class Ataque {
    protected String nome;
    protected int dano;

    public Ataque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }

    public void usar() {
        System.out.println("Ataque: " + nome + " causa " + dano + " de dano!");
    }

    @Override
    public String toString() {
        return nome + " (" + dano + " dmg)";
    }
}

class PadraoAtaque extends Ataque {
    public PadraoAtaque(String nome, int dano) {
        super(nome, dano);
    }
}

class Boss {
    protected String nome;
    protected String idBoss;
    protected String pontoFraco;
    protected LinkedHashSet<Ataque> moveset;

    public Boss(String nome, String idBoss, String pontoFraco) {
        this.nome = nome;
        this.idBoss = idBoss;
        this.pontoFraco = pontoFraco;
        this.moveset = new LinkedHashSet<>();
    }

    public void adicionarAtaque(Ataque ataque) {
        moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("\nIniciando a fase contra " + nome + "");
        System.out.println("Ponto fraco: " + pontoFraco);
        System.out.println("Ataques disponiveis:");
        for (Ataque a : moveset) {
            System.out.println("- " + a);
        }
    }

    public String getId() {
        return idBoss;
    }
}

class BossMagico extends Boss {
    public BossMagico(String nome, String idBoss, String pontoFraco) {
        super(nome, idBoss, pontoFraco);
    }

    @Override
    public void iniciarFase() {
        System.out.println("\nO ar brilha... " + nome + " conjura magia ancestral!");
        super.iniciarFase();
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        arena.put(boss.getId(), boss);
        System.out.println("Boss " + boss.nome + " adicionado a arena!");
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Nenhum boss encontrado com o ID: " + idBoss);
        }
    }
}

public class Main {
    public static void main(String[] args) {
        PadraoAtaque golpe = new PadraoAtaque("Golpe Brutal", 35);
        PadraoAtaque rugido = new PadraoAtaque("Rugido Ensurdecedor", 15);
        PadraoAtaque bolaFogo = new PadraoAtaque("Bola de Fogo", 40);
        PadraoAtaque raio = new PadraoAtaque("Raio Arcano", 50);

        Boss boss1 = new Boss("Gronk, o Gosmento", "001", "Gelo");
        BossMagico boss2 = new BossMagico("Shrek, o Arcano", "002", "Silencio");

        boss1.adicionarAtaque(golpe);
        boss1.adicionarAtaque(rugido);
        boss2.adicionarAtaque(bolaFogo);
        boss2.adicionarAtaque(raio);

        Batalha batalha = new Batalha();
        batalha.adicionarBoss(boss1);
        batalha.adicionarBoss(boss2);

        batalha.iniciarBatalha("001");
        batalha.iniciarBatalha("002");
        batalha.iniciarBatalha("999"); // Teste de ID inexistente
    }
}