
    v = {}
    print("Quantos num:")
    n = io.read("*number")   
    for i = 0, n - 1, 1
    do
      print("Escreve um num:")
      v[i] = io.read("*number")  
    end
    maior = v[0]
    for i = 0, n - 1, 1
    do
      if maior < v[i] then
        maior = v[i]
      end
    end
    print(maior)
      