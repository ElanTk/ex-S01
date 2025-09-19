#include <iostream>
using namespace std;

int fibonacci(int n){
    if(n == 0){
        return 0;
    }
    else if(n == 1){
        return 1;
    }
    else{
        return (fibonacci(n - 1) + fibonacci(n - 2));
    }
}

int main()
{
    int fibPos, fib;
    cout << "Boa tarde meu nobre, bem vindo ao fibonacci 2000!" << endl;
    cout << "Insira que posicao o numero fibonacci que quer ver esta." << endl;
    cin >> fibPos;
    fib = fibonacci(fibPos);
    cout << "Seu fibonacci é: " << fib << endl;

    return 0;
}