import java.util.ArrayList;


class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }
    public int getIdade() {
        return idade;
    }
}


class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }
    public String getMagia() {
        return magia;
    }
    public String lancarFeitico() {
        return getNome() + " lança o feitico: " + magia + "!";
    }
}

class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Castelo {
    private String nome;
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }

    public String getNome() {
        return nome;
    }

    public ArrayList<Divisao> getDivisoes() {
        return divisoes;
    }

    public void adicionarDivisao(Divisao divisao) {
        divisoes.add(divisao);
    }
}
public class Main {
    public static void main(String[] args) {
        
        Divisao sala = new Divisao("Sala de Estar");
        Divisao cozinha = new Divisao("Cozinha");
        Divisao biblioteca = new Divisao("Biblioteca");
        Divisao laboratorio = new Divisao("Laboratorio de Poções");

        Castelo castelo = new Castelo("Castelo Animado", new ArrayList<Divisao>());
        castelo.adicionarDivisao(sala);
        castelo.adicionarDivisao(cozinha);
        castelo.adicionarDivisao(biblioteca);
        castelo.adicionarDivisao(laboratorio);

        Mago howl = new Mago("Howl", 30, "Feitico de Fogo");

        System.out.println("Nome do Castelo: " + castelo.getNome());
        System.out.println("Divisões do castelo:");
        for (Divisao d : castelo.getDivisoes()) {
            System.out.println("- " + d.getNome());
        }


        System.out.println("\nMago: " + howl.getNome());
        System.out.println("Idade: " + howl.getIdade());
        System.out.println("Magia principal: " + howl.getMagia());

        howl.setNome("Howl Jenkins Pendragon");

        System.out.println("\nApos atualizacoes:");
        System.out.println("Nome: " + howl.getNome());
        System.out.println("Idade: " + howl.getIdade());
        System.out.println("Magia: " + howl.getMagia());

        System.out.println("\nAcao magica: " + howl.lancarFeitico());
    }
}