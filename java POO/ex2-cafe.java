import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public double calcularPrecoFinal() {
        return precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    public void setBonusAroma(double bonusAroma) {
        this.bonusAroma = bonusAroma;
    }

    @Override
    public double calcularPrecoFinal() {
        return getPrecoBase() + bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    public ArrayList<Cafe> getItens() {
        return itens;
    }

    public void adicionarItem(Cafe cafe) {
        itens.add(cafe);
    }
}

class CafeLeblanc {
    private Menu _menu;

    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Cliente pediu: " + cafe.getNome());
        System.out.printf("Preço final: R$ %.2f\n", cafe.calcularPrecoFinal());
    }
}

public class Main {
    public static void main(String[] args) {

        Cafe expresso = new Cafe("Expresso", 6.00);
        Cafe capuccino = new Cafe("Capuccino", 8.50);
        CafeGourmet mochaGourmet = new CafeGourmet("Mocha Gourmet", 12.00, 3.50);
        CafeGourmet carameloGourmet = new CafeGourmet("Caramelo Deluxe", 10.00, 2.00);

        Menu menu = new Menu(new ArrayList<Cafe>());
        menu.adicionarItem(expresso);
        menu.adicionarItem(capuccino);
        menu.adicionarItem(mochaGourmet);
        menu.adicionarItem(carameloGourmet);

        CafeLeblanc cafeteria = new CafeLeblanc(menu);

        System.out.println("MENU DO DIA:");
        for (Cafe c : menu.getItens()) {
            System.out.printf(" - %-20s | Preço Final: R$ %.2f\n", c.getNome(), c.calcularPrecoFinal());
        }

        System.out.println("\nPEDIDOS:");
        cafeteria.receberPedido(expresso);
        cafeteria.receberPedido(mochaGourmet);
    }
}
