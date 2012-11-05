module ACME
  class Regulador
    TOLERANCIA  = 2.0
    CUSTO_USO   = 0.1
    CUSTO_LIGAR = 0.5

    def initialize
      @hardware = Hardware.new
    end

    # "A função que você precisa implementar deverá ter o seguinte modelo:
    # refrigera(temp_atual, temp_desejada, ...)"
    def refrigera(temperatura, temperatura_ideal)
      custo = 0.0

      if temperatura > maxima_aceitavel(temperatura_ideal) 
        custo += CUSTO_LIGAR

        begin
          Hardware.reduz_um_grau
          temperatura -= 1
          custo += CUSTO_USO
        end while (temperatura >= minima_aceitavel(temperatura_ideal) + 1)
      end

      # "A sua função deve ainda retornar uma tupla com
      # a temperatura final e o custo da redução de temperatura."
      [temperatura, custo]
    end

    private
    
    def minima_aceitavel(temperatura_ideal)
      @_minima_aceitavel ||= temperatura_ideal - TOLERANCIA
    end

    def maxima_aceitavel(temperatura_ideal)
      @_maxima_aceitavel ||= temperatura_ideal + TOLERANCIA
    end

  end
end
