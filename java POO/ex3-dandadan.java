import java.util.HashMap;

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Entidades implements IRastreavel {
    protected String nome;
    protected String localizacao;
    protected Poder poder;

    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public Poder getPoder() {
        return poder;
    }

    @Override
    public String obterCoordenadas() {
        return "Entidade " + nome + " localizada em " + localizacao;
    }
}

class Youkai extends Entidades {
    public Youkai(String nome, String localizacao, Poder poder) {
        super(nome, localizacao, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai " + nome + " detectado em " + localizacao + " com poder de " + poder.getNome() + ".";
    }
}

class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String localizacao, String planetaOrigem, String ovni) {
        super(nome, localizacao, new Poder("Tecnologia Avancada"));
        this.planetaOrigem = planetaOrigem;
        this.ovni = ovni;
    }

    public String getPlanetaOrigem() {
        return planetaOrigem;
    }

    public String getOvni() {
        return ovni;
    }

    @Override
    public String obterCoordenadas() {
        return "Alien " + nome + " vindo de " + planetaOrigem + " avistado em " + localizacao + " com o " + ovni + ".";
    }
}

class Registros {
    private String nomeEquipe;
    private HashMap<String, Entidades> avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade, String nome) {
        if (!avistamentos.containsKey(nome)) {
            avistamentos.put(nome, entidade);
            System.out.println("Avistamento registrado: " + entidade.obterCoordenadas());
            return true;
        } else {
            System.out.println("Entidade '" + nome + "' ja registrada.");
            return false;
        }
    }

    public void exibirAvistamentos() {
        for (String nome : avistamentos.keySet()) {
            System.out.println("- " + avistamentos.get(nome).obterCoordenadas());
        }
    }
}

public class Main {
    public static void main(String[] args) {

        Poder telepatia = new Poder("Telepatia");
        Poder ilusao = new Poder("Cricao de Ilusoes");

        // Criando entidades
        Alien alien1 = new Alien("Aqueles aliens com p4u de aco", "Area 51", "Andromeda", "Nave Alfa");
        Youkai youkai1 = new Youkai("Kitsune", "Monte Fuji", ilusao);
        Youkai youkai2 = new Youkai("Vovo Turbo", "Kyoto", new Poder("Força Sobrenatural"));
        Alien alien2 = new Alien("Aqueles aliens com p4u de aco", "Area 51", "Andromeda", "Nave Alfa"); // Mesmo nome -> duplicado

        Registros registros = new Registros("Equipe Oculta");

        registros.registrarAvistamento(alien1, alien1.getNome());
        registros.registrarAvistamento(youkai1, youkai1.getNome());
        registros.registrarAvistamento(youkai2, youkai2.getNome());

        boolean resultado = registros.registrarAvistamento(alien2, alien2.getNome());
        System.out.println("\nTentando registrar duplicado: " + (resultado ? "Sucesso" : "Falhou (ja existe)"));

        System.out.println("\nENTIDADES AVISTADAS:");
        registros.exibirAvistamentos();
    }
}