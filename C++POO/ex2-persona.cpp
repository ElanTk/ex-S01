#include <iostream>
using namespace std;

class Pessoa {
  private:
    string nome;
    int idade;
    
  public:
    void setNome(string n){
        nome = n;
    }
    string getNome(){
        return nome;
    }
    void setIdade(int i){
        idade = i;
    }
    int getIdade(){
        return idade;
    }
};

class Protagonista : public Pessoa {
  private:
    int nivel;
    
  public:
    void setNivel(int n){
        nivel = n;
    }
    int getNivel(){
        return nivel;
    }
};

class Personagem : public Pessoa {
  private:
    int rank;
    
  public:
    void setRank(int r){
        if(r >= 0 && r <= 10){
            rank = r;
        }
    }
    int getRank(){
        return rank;
    }
};

int main()
{
    Protagonista joker;
    joker.setNome("Joker");
    joker.setIdade(17);
    joker.setNivel(5);
    Personagem morgana;
    morgana.setNome("Morgana");
    morgana.setIdade(2);
    morgana.setRank(2);
    
    cout << "Protagonista: " << joker.getNome() << " idade: " << joker.getIdade() << " nivel: " << joker.getNivel() << endl;
    cout << "Personagem: " << morgana.getNome() << " idade: " << morgana.getIdade() << " rank: " << morgana.getRank() << endl;
    return 0;
}