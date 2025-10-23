class Drink
    
  attr_reader :_nome

  def initialize(nome, preco_base)
    @_nome = nome
    self.preco_base = preco_base 
  end

  def preco_base
    @_preco_base
  end

  def preco_base=(valor)
    if valor.to_f > 0
      @_preco_base = valor.to_f
    else
      raise ArgumentError, "O preco base deve ser positivo!"
    end
  end

  def preco_final
    preco_base
  end

  def to_s
    "Drink: #{@_nome}, Preço base: R$#{'%.2f' % preco_base}"
  end
end

class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @_anos_desde_criacao = anos_desde_criacao.to_i
  end

  def preco_final
    preco_base + (@_anos_desde_criacao * 5)
  end

  def to_s
    "Drink lendário: #{@_nome}, Idade: #{@_anos_desde_criacao} anos, Preço final: R$#{'%.2f' % preco_final}"
  end
end

# MAIN

print "Digite o nome do drink: "
nome = gets.chomp

print "Digite o preço base do drink: "
preco = gets.chomp.to_f

print "Digite a idade do drink (anos desde a criação): "
anos = gets.chomp.to_i

begin
  drink_lendario = DrinkLenda.new(nome, preco, anos)
  puts "\n#{drink_lendario}"
rescue ArgumentError => e
  puts "Erro: #{e.message}"
end