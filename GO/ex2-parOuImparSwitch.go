package main
import "fmt"

func main() {
  var n int
  fmt.Print("Escreva um numero inteiro: ")
  fmt.Scan(&n)
  switch n % 2 {
      case 0:
        fmt.Print("O número é par")
      default:
        fmt.Print("O número é impar")
  }
}