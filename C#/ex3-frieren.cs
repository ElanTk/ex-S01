using System;
using System.Collections.Generic;

public class Feitico{
    private string nome;
    private string efeito;

    public Feitico(string nome, string efeito){
        this.nome = nome;
        this.efeito = efeito;
    }

    public void ExibirInfo(){
        Console.WriteLine("---Feitico: " + nome + " ---Propriedades: " + efeito);
    }
}


public class Grimorio{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico feitico){
        feiticos.Add(feitico);
    }

    public void ListarFeiticos(){
        Console.WriteLine(" Feiticos no grimorio: ");
        foreach (Feitico feitico in feiticos)
        {
            feitico.ExibirInfo();
        }
    }
}


public class Ferramenta
{
    public string nome;

    public Ferramenta(string nome){
        this.nome = nome;
    }
}


public class Maga
{
    private string nome;
    public Grimorio grimorio;
    private List<Ferramenta> ferramentas;

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        this.nome = nome;
        this.grimorio = new Grimorio(); 
        this.ferramentas = ferramentas; 
    }

    public void ExibirEquipamento()
    {
        Console.WriteLine(" Maga: " + nome);
        Console.WriteLine("Ferramentas carregadas:" );
        foreach (var ferramenta in ferramentas)
        {
            Console.WriteLine(">" + ferramenta.nome);
        }
    }
}

public class MainExec
{
    public static void Main(string[] args)
    {
        var ferramentas = new List<Ferramenta> {
            new Ferramenta("Cajado"),
            new Ferramenta("Lanterna Magica")
        };

        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.grimorio.AdicionarFeitico(new Feitico("Zoltraak", "primeira magia para matar."));
        frieren.grimorio.AdicionarFeitico(new Feitico("Magia de Limpar Roupas", "Magia mitica que deixa as roupas completamente limpas."));

        frieren.ExibirEquipamento();
        frieren.grimorio.ListarFeiticos();
    }
}