use std::io;

fn verificar_senha(senha: &str) -> bool{
let mut has_upper = false;
let mut has_number = false;
    for c in senha.chars() {
        if c.is_digit(10){
            has_number = true;
        }
        if c.is_ascii_uppercase(){
            has_upper = true;
        }
    }
    if has_upper && has_number && senha.len() > 7 {
        return true;
    }
    return false;
}

fn main() {
    let mut acesso = false;
    let mut senha = String::new();
    while acesso == false {
        println!("Insira uma senha:");
        io::stdin().read_line(&mut senha).expect("Ixi, pior que deu problema");
        if verificar_senha(senha.as_str()) {
            println!("Senha válida! Acesso concedido.");
            acesso = true;
        }
        else{
            println!("Essa senha não dá não.");
        }
    }
}