class Condicionador
  TOLERANCIA  = 2
  CUSTO_LIGAR = 0.5
  CUSTO_USO   = 0.1
  attr_accessor :temperatura, :custo

  def initialize(temperatura_inicial, temperatura_ideal)
    @compressor_ligado = false
    @temperatura = temperatura_inicial
    @temperatura_tolerada = temperatura_ideal + TOLERANCIA
    @custo = 0.0
  end

  def aumenta_temperatura(valor = 1)
    @temperatura += valor
  end

  def reajusta
    while(@temperatura > @temperatura_tolerada)
      prepara_compressor
      diminui_temperatura
      registra_uso
    end
  end

  private

  def prepara_compressor
    unless @compressor_ligado
      registra_compressor
      @compressor_ligado = true
    end
  end

  def registra_compressor
    @custo += CUSTO_LIGAR
  end

  def registra_uso
    @custo += CUSTO_USO
  end

  def diminui_temperatura(valor = 1)
    @temperatura -= valor
  end

end
