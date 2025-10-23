
module Rastreavel
  def obter_localizacao(hora)
    "Localização as #{hora}: #{@localizacao}"
  end
end

module Perigoso
  def calcular_risco
    # nao tem um jeito especifico de calcular o perigo, entao simulei colocando "Alto"
    "Nivel de risco de #{@nome}: Alto."
  end
end

class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
    @localizacao = "Desconhecida"
  end

  def to_s
    "#{@nome} (Localização atual: #{@localizacao})"
  end
end

class Detetive < Participante
  include Rastreavel

  def obter_localizacao(hora)
    "Detetive #{@nome} foi visto em #{@localizacao} as #{hora}."
  end
end

class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def obter_localizacao(hora)
    "Mestre do Crime #{@nome} foi detectado proximo de #{@localizacao} as #{hora}."
  end

  def calcular_risco
    "#{@nome} apresenta risco extremo! Evitar contato direto!"
  end
end


class Cenario
  attr_reader :participantes

  def initialize
    @participantes = []
  end

  def adicionar_participante(p)
    @participantes << p
  end

  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  def listar_rastreaveis(hora)
    puts "\nRastreamento dos participantes as #{hora}:"
    @participantes.each do |p|
      if p.respond_to?(:obter_localizacao)
        puts p.obter_localizacao(hora)
      end
    end
  end
end

# MAIN

sherlock = Detetive.new("Sherlock Holmes")
moriarty = MestreDoCrime.new("Moriarty")

print "Digite a localizacao atual de #{sherlock.nome} dentro de Londres: "
sherlock.localizacao = gets.chomp

print "Digite a localizacao atual de #{moriarty.nome} dentro de Londres: "
moriarty.localizacao = gets.chomp

londres = Cenario.new
londres.adicionar_participante(sherlock)
londres.adicionar_participante(moriarty)

print "\nDigite a hora atual: "
hora_atual = gets.chomp

londres.listar_rastreaveis(hora_atual)

puts "\nVerificando ameaças em londres nesse horario..."
ameacas = londres.identificar_ameacas

if ameacas.empty?
  puts "Nenhum criminoso detectado no cenario."
else
  ameacas.each do |criminoso|
    puts criminoso.obter_localizacao(hora_atual)
    puts criminoso.calcular_risco
  end
end