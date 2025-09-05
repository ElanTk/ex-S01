fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64{
    return ((2.0 * nota1) + (3.0 * nota2) + (5.0 * nota3)) / 10.0;
}
fn main() {
    let nota1: f64 = 7.5;
    let nota2: f64 = 8.0;
    let nota3: f64 = 9.2;
    let media: f64 = calcular_media(nota1, nota2, nota3);
    
    println!("Ah, sua media deu: {}", media);
    println!("Voce foi...");
    if media < 7.0{
        println!("Reprovado.");
    }
    else{
        println!("Aprovado!");
    }
}