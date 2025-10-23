class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "O metodo tocar_partitura deve ser implementado nas subclasses!"
  end

  def to_s
    "#{@nome} (#{@instrumento})"
  end
end

class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  def tocar_partitura(peca)
    puts "#{@nome} tenta tocar a peça '#{peca}' ao piano."
  end
end

class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  def tocar_partitura(peca)
    puts "#{@nome} mexe as cordas do violino tentando seguir a '#{peca}'."
  end
end

class Maestro
  attr_reader :nome, :musicos

  def initialize(nome, musicos)
    @nome = nome
    @musicos = musicos
  end

  def iniciar_ensaio(peca)
    puts "\n🎼 Maestro #{@nome} inicia o ensaio da peça '#{peca}'!\n\n"
    @musicos.each do |musico|
      musico.tocar_partitura(peca)
    end
  end

  def mudar_foco(estado)
    puts "\nMudando o foco dos músicos...\n\n"
    mensagens = @musicos.map do |musico|
      "#{musico.nome} agora está #{estado}!"
    end
    mensagens.each { |msg| puts msg }
  end
end

# MAIN

musicos = [
  Pianista.new("Mozart 2"),
  Violinista.new("O Arco"),
  Violinista.new("Marcos Plaza")
]

maestro = Maestro.new("O Violino", musicos)

print "Digite o nome da peça a ser ensaiada: "
peca = gets.chomp

maestro.iniciar_ensaio(peca)

print "\nDigite o novo estado de foco para o maestro dar para os musicos: "
estado = gets.chomp
maestro.mudar_foco(estado)