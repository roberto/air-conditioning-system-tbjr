module ACME
  class ArCondicionado
    attr_reader :temperatura, :custo_total

    def initialize(temperatura_inicial, temperatura_ideal, regulador = nil)
      @regulador = regulador || Regulador.new
      @temperatura = temperatura_inicial
      @temperatura_ideal = temperatura_ideal
      @custo_total = 0.0
    end

    # "Os argumentos temp_atual e temp_desejada serão passados pra você pelo ar-condicionado."
    def reajusta
      nova_temperatura, custo = @regulador.refrigera(@temperatura, @temperatura_ideal)
      @temperatura = nova_temperatura
      @custo_total += custo
    end

    def aumenta_temperatura(variacao)
      @temperatura += variacao
    end

  end
end
