#include <iostream>
using namespace std;

float somarArray(float arr[], int tamanho){
    float total = 0;
    for(int i = 0; i < tamanho; i++){
        total = total + arr[i];
    }
    return total;
}

int main()
{
    int tamanho;
    float array[100], total;
    
    cout << "Escreva quantos numeros vao ter no array." << endl;
    cin >> tamanho;
    
    for(int i = 0; i < tamanho; i++){
        cout << "insira um num: ";
        cin >> array[i];
    }
    
    total = somarArray(array, tamanho);
    
    cout << endl << "O total dos numeros é: " << total << endl;
    
    
    return 0;
}