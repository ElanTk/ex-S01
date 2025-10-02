#include <iostream>
#include <list>
using namespace std;

class SerVivo {
  public:
    string nome;
    
    virtual void apresentar() {
        cout << "Ola, meu nome é " << nome << " e eu sou um ser vivo ou sei la, vai saber." << endl;
    }
};

class Humano : public SerVivo {
  public:
    void apresentar() override {
        cout << "Ola, meu nome é " << nome << " e sou Humano, surpreendentemente." << endl;
    }
};

class Elfo : public SerVivo {
  public:
    void apresentar() override {
        cout << "Ola, meu nome é " << nome << " e eu sou da raca Elfica." << endl;
    }
};

class Fada : public SerVivo {
  public:
    void apresentar() override {
        cout << "Ola, meu nome é " << nome << " e sou uma fada, ou sera que nao?" << endl;
    }
};

int main()
{
    Humano humano1;
    humano1.nome = "Marcelo";
    Elfo elfo1;
    elfo1.nome = "Garrendaia";
    Fada fada1;
    fada1.nome = "Tulipia";
    
    list<SerVivo*> seresVivos;
    seresVivos.push_back(&humano1);
    seresVivos.push_back(&elfo1);
    seresVivos.push_back(&fada1);

    for (SerVivo* serVivo : seresVivos) {
        serVivo->apresentar();
    }
    
    return 0;
}