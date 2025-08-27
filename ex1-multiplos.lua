print("Escreve o M:")
    m = io.read("*number")      
    print("Escreve o N:")
    n = io.read("*number")      
    print("Por ultimo, escreva o X:")
    x = io.read("*number")   
    
    for i = m, n + 1, 1
    do
      if i % x == 0 then
        print(i)
      end

    end
