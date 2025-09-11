package main
import "fmt"

func classificar_numero(num int) string{
    if(num > 0){
        return "Positivo"
    } else if(num == 0){
        return "Zero"
    } else{
        return "Negativo"
    }
}

func main() {
  var n int
  fmt.Print("Escreva um numero inteiro: ")
  fmt.Scan(&n)
  fmt.Println("Classifico seu numero como:", classificar_numero(n))
}