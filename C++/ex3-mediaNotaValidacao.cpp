#include <iostream>
using namespace std;

bool verificarNota(int nota){
    if(nota >= 1 && nota <= 10){
        return true;
    }
    else{
        cout << "Nota invalida!" << endl;
        return false;
    }
    
}

int main()
{
    int numNotas;
    float nota, input, media, total = 0;
    
    cout << "Quantas notas quer inserir: " << endl;
    cin >> numNotas;
    
    bool verificado = false;
    for(int i = 0; i < numNotas; i++){
        while(verificado == false){
            cout << "insira uma nota: ";
            cin >> input;
            verificado = verificarNota(input);
        }
        total = total + input;
        verificado = false;
    }
    
    media = total / numNotas;
    cout << "Sua media final: " << media << endl;
    if(media < 7){
        cout << "Reprovado." << endl;
    }
    else{
        cout << "Aprovado!!" << endl;
    }
    
    
    return 0;
}