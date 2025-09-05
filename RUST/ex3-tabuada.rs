use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32){
    for i in limite_inferior..=limite_superior{
        println!("{} * {} = {}", numero, i, numero*i);
    }
}
fn main() {
    let mut input1 = String::new();
    let mut input2 = String::new();
    let mut input3 = String::new();
    let num: i32;
    let lim_inf: i32;
    let lim_sup: i32;
    
    println!("Que numero quer tabuar? ");
    io::stdin().read_line(&mut input1).expect("Ixi, pior que deu problema");
    num = input1.trim().parse().expect("isso dai nao era um numero man1 :/");
    
    println!("limite inferior do tabuacionamento: ");
    io::stdin().read_line(&mut input2).expect("Ixi, pior que deu problema");
    lim_inf = input2.trim().parse().expect("isso dai nao era um numero man1 :/");
    
    println!("limite superior da tabuadenda: ");
    io::stdin().read_line(&mut input3).expect("Ixi, pior que deu problema");
    lim_sup = input3.trim().parse().expect("isso dai nao era um numero man1 :/");
    
    imprimir_tabuada(num, lim_inf, lim_sup);
}