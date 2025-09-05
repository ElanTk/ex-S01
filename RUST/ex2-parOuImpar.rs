use std::io;

fn eh_par(numero: i32) -> bool{
    if numero % 2 == 0 {
        return true;
    }
    else{
        return false;
    }
}
fn main() {
    let mut input1 = String::new();
    let mut input2 = String::new();
    let num_jog1: i32;
    let num_jog2: i32;
    let mut wincon_jog1 = String::new();
    let total;
    
    println!("Jogador 1, (par) ou (impar)? ");
    io::stdin().read_line(&mut wincon_jog1).expect("Ixi, pior que deu problema");
    println!("Jogador 1, escreva seu numero");
    io::stdin().read_line(&mut input1).expect("Ixi, pior que deu problema");
    num_jog1 = input1.trim().parse().expect("isso dai nao era um numero man1 :/");
    
    println!("Jogador 2, escreva seu numero");
    io::stdin().read_line(&mut input2).expect("Ixi, pior que deu problema");
    num_jog2 = input2.trim().parse().expect("isso dai nao era um numero man2 :/");
    
    total = num_jog1 + num_jog2;
    
    if eh_par(total){
        if wincon_jog1.trim() == "par"{
            println!("O jogador 1 ganhou. Soma: {}. Par.", total);
        }
        else {
            println!("O jogador 2 ganhou. Soma: {}. Par.", total);
        }
    }
    else{
        if wincon_jog1.trim() == "impar"{
            println!("O jogador 1 ganhou. Soma: {}. Impar.", total);
        }
        else {
            println!("O jogador 2 ganhou. Soma: {}. Impar.", total);
        }
    }
}