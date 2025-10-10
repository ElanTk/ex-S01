using System;
using System.Collections.Generic;

public class Pokemon {
    public string nome;

    public virtual void Atacar() {
        Console.WriteLine(nome + " se joga contra o pokemon oponente!");
    }
}

public class PokemonDeAgua : Pokemon {
    public override void Atacar() {
        Console.WriteLine(nome + " produz um jato super-pressurizado de agua diretamente no oponente!");
    }
}

public class PokemonDeFogo : Pokemon {
    public override void Atacar() {
        Console.WriteLine(nome + " solta varios dardos flamejantes atras do seu oponente!");
    }
}

public class MainExec {
    public static void Main(string[] args) {
        PokemonDeFogo pokemon1 = new PokemonDeFogo();
        pokemon1.nome = "Charizard";

        PokemonDeAgua pokemon2 = new PokemonDeAgua();
        pokemon2.nome = "Blastoise";

        List<Pokemon> pokemons = new List<Pokemon> { pokemon1, pokemon2 };

        foreach (Pokemon pokemon in pokemons) {
            pokemon.Atacar(); // Agora chama o método certo de cada classe
        }
    }
}