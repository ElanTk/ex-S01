package main
import "fmt"

func fibonacci(num int){
    var atual int
    var ult int
    var pen int
    var i int
    for i = 0; i < num; i++ {
        if(i == 0){
            atual = 0
            fmt.Print(atual)
            ult = atual
        }
        if(i == 1){
            fmt.Print(", ")
            atual = 1
            fmt.Print(atual)
            pen = ult
            ult = atual
        }
        if(i > 1){
            fmt.Print(", ")
            atual = ult + pen
            fmt.Print(atual)
            pen = ult
            ult = atual
        }
    }
}
func main() {
  var n int
  fmt.Print("Escreva quantos dig do fibonacci quer ver: ")
  fmt.Scan(&n)
  fibonacci(n)
}