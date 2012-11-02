class Condicionador
  TOLERANCIA = 2
  attr_accessor :temperatura, :custo

  def initialize(temperatura_inicial, temperatura_desejada)
    @compressor_ligado = false
    @temperatura = temperatura_inicial
    @temperatura_desejada = temperatura_desejada + TOLERANCIA
    @custo = 0.0
  end

  def reduz_um_grau
    liga_compressor
    @temperatura -= 1.0
    incrementa_custo
  end

  def liga_compressor
    unless @compressor_ligado
      incrementa_custo(0.5) 
      @compressor_ligado = true
    end
  end

  def reajusta
    while(temperatura > @temperatura_desejada)
      reduz_um_grau
    end
  end

  #TODO passar para Simulador
  def self.refrigera(temperatura_atual, temperatura_desejada, minutos = 0, variacao = 0)
  condicionador = Condicionador.new(temperatura_atual, temperatura_desejada)

  condicionador.reajusta
  minutos.times do
    condicionador.temperatura += variacao
    condicionador.reajusta
  end
  [condicionador.temperatura, condicionador.custo.round(2)]
  end

  private

  def incrementa_custo(valor = 0.1)
    @custo += valor
  end

end
