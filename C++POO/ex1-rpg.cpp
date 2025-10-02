#include <iostream>
using namespace std;

class Personagem {
  public:
    string nome;
    int nivel;
    int dano;
    int vida;
    
    void atacar(Personagem &alvo){
        cout << nome << " causa " << dano << " de dano a: " << alvo.nome << endl;
        alvo.vida = alvo.vida - dano;
    }
};

int main()
{
    Personagem jogador1;
    jogador1.nome = "Marcos";
    jogador1.nivel = 3;
    jogador1.dano = 5;
    jogador1.vida = 25;
    Personagem jogador2;
    jogador2.nome = "Carlos";
    jogador2.nivel = 1;
    jogador2.dano = 3;
    jogador2.vida = 10;
    
    cout << "Jogador1: " << jogador1.nome << " nivel: " << jogador1.nivel << " dano: " << jogador1.dano << " vida: " << jogador1.vida << endl;
    cout << "Jogador2: " << jogador2.nome << " nivel: " << jogador2.nivel << " dano: " << jogador2.dano << " vida: " << jogador2.vida << endl;
    
    jogador1.atacar(jogador2);
    
    cout << "Jogador1: " << jogador1.nome << " nivel: " << jogador1.nivel << " dano: " << jogador1.dano << " vida: " << jogador1.vida << endl;
    cout << "Jogador2: " << jogador2.nome << " nivel: " << jogador2.nivel << " dano: " << jogador2.dano << " vida: " << jogador2.vida << endl;

    return 0;
}