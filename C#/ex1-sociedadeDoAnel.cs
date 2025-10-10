using System;

public class MembroDaSociedade{
    private String nome;
    private String raca;
    private String funcao;

    public MembroDaSociedade(String nome, String raca, String funcao){
        this.nome = nome;
        this.raca = raca;
        this.funcao = funcao;
    }

    public void Descrever(){
        Console.WriteLine ("---Nome: " + this.nome + " ---Raca: " + this.raca + " ---Funcao: " + this.funcao);
    }
}

public class MainExec{
    public static void Main(string[] args){
        MembroDaSociedade Membro1 = new MembroDaSociedade("Aragorn", "Humano", "Guardiao");
        MembroDaSociedade Membro2 = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");
        Membro1.Descrever();
        Membro2.Descrever();
    }
}