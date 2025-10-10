using System;
using System.Collections.Generic;


public abstract class MonstroSombrio{
    public string nome;

    public virtual void Mover(){
        Console.WriteLine(this.nome + " se move nas sombras...");
    }
}

public class Zumbi : MonstroSombrio{

    public override void Mover(){
        Console.WriteLine(this.nome + " anda lentamente, arrastando os pezinhos...");
    }
}

public class Espectro : MonstroSombrio{

    public override void Mover(){
        Console.WriteLine(this.nome + " desliza pelo ar em silencio...");
    }
}


public class MainExec
{
    public static void Main(string[] args)
    {
        MonstroSombrio monstro1 = new Zumbi();
        monstro1.nome = "Marcos";
        MonstroSombrio monstro2 = new Espectro();
        monstro2.nome = "Carlos";

        List<MonstroSombrio> monstros = new List<MonstroSombrio> { monstro1, monstro2 };

        foreach (var monstro in monstros)
        {
            monstro.Mover();
        }
    }
}