
    v = {}
    v2 = {}
    print("Quantos num:")
    n = io.read("*number")   
    for i = 0, n - 1, 1
    do
      print("Escreve um num:")
      v[i] = io.read("*number")  
    end
    maior = v[0]
    j = 0
    for i = 0, n - 1, 1
    do
      if v[i] % 2 == 0 then
        v2[j] = v[i]
        j = j + 1
      end
    end
    
    for i = 0, j - 1, 1
    do
      print(v2[i])
    end
      