module ACME
  class Simulador
    MINUTOS = 360
    VARIACAO_TEMPERATURA = 0.5
    TEMPERATURA_INICIAL = 30
    TEMPERATURA_IDEAL = 20

    def initialize(regulador = nil)
      @regulador = regulador || Regulador.new
      @temperatura = TEMPERATURA_INICIAL
      @custo_total = 0.0
    end

    def executa
      regula_temperatura
      MINUTOS.times do
        aumenta_temperatura
        regula_temperatura
      end

      [@temperatura.round(2), @custo_total.round(2)]
    end


    private
    
    # "Os argumentos temp_atual e temp_desejada serão passados pra você pelo ar-condicionado."
    def regula_temperatura
      nova_temperatura, custo = @regulador.refrigera(@temperatura, TEMPERATURA_IDEAL)
      @temperatura = nova_temperatura
      @custo_total += custo
    end

    def aumenta_temperatura
      @temperatura += VARIACAO_TEMPERATURA
    end

  end
end
