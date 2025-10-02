#include <iostream>
using namespace std;

class Pessoa {
  public:
    string nome;
    
    virtual void apresentar(){
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
};

class Professor : public Pessoa {
  public:
    string disciplina;
    
    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um professor de disciplina " << disciplina << "." << endl;
    }
};

class Aluno : public Pessoa {
  public:
    string curso;
    int matricula;
    
    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um aluno de " << curso << "." << endl;
    }
};

int main()
{
    Professor professor1;
    Aluno aluno1;
    Pessoa* pessoa1 = &professor1;
    Pessoa* pessoa2 =  &aluno1;
    
    professor1.nome = "Marcos2";
    professor1.disciplina = "Matematica 0";
    
    aluno1.nome = "Carlos2";
    aluno1.curso = "Engenharia de pelucia";
    aluno1.matricula = 382;
    
    pessoa1->apresentar();
    pessoa2->apresentar();
    
    return 0;
}