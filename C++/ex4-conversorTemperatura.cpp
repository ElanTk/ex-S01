#include <iostream>
using namespace std;

double celsiusParaFahrenheit(double celsius){
    return(celsius * 9/5) + 32;
}

double celsiusParaKelvin(double celsius){
    return celsius + 273.15;
}

int main()
{
    int userChoice = -1;
    double celsius;
    cout << "Bem vindo ao convertor celcius fahrenheit kelvin 2500!" << endl;
    
    while(userChoice != 3){
        cout << "1. Converter Celsius para Fahrenheit." << endl;
        cout << "2. Converter Celsius para Kelvin." << endl;
        cout << "3. Sair." << endl;
        cin >> userChoice;
        
        switch(userChoice){
            case 1:
                cout << "Insira a temperatura em C: " << endl;
                cin >> celsius;
                cout << "Em fahrenheit, da: " << celsiusParaFahrenheit(celsius) << endl;
                break;
            
            case 2:
                cout << "Insira a temperatura em C: " << endl;
                cin >> celsius;
                cout << "Em kelvin, da: " << celsiusParaKelvin(celsius) << endl;
                break;
            
            case 3:
                break;
            
            default:
                cout << "Escolha invalida!!" << endl;
                break;
        }
    }
    
    cout << "Obrigado por usar!" << endl;
    return 0;
}