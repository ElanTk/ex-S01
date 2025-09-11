package main
import "fmt"
//Sim, o exercício pediu que usuario fosse "senha" e senha fosse "admin", sla porque
func verificarLogin(usuario, senha string) bool{
    if usuario == "senha" && senha == "admin"{
        return true
    } else{
        return false
    }
}
func main() {
  var usuario string
  var senha string
  for{
    fmt.Print("Escreva o usuario: ")
    fmt.Scan(&usuario)
    fmt.Print("Escreva a senha: ")
    fmt.Scan(&senha)
    if(verificarLogin(usuario, senha)){
        fmt.Print("Login bem-sucedido!")
        break
    } else{
        fmt.Print("Algo ae ta errado, tenta de novo amigão.\n")
    }
  }
}