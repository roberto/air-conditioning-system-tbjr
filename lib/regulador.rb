module ACME
  class Regulador
    TOLERANCIA  = 2
    CUSTO_USO   = 0.1
    CUSTO_LIGAR = 0.5

    def initialize
      @hardware = Hardware.new
      @compressor_ligado = false
    end

    # "A função que você precisa implementar deverá ter o seguinte modelo:
    # refrigera(temp_atual, temp_desejada, ...)"
    def refrigera(temperatura_inicial, temperatura_ideal)
      custo = 0.0
      temperatura_tolerada = temperatura_ideal + TOLERANCIA
      calor = temperatura_inicial.ceil - temperatura_tolerada.ceil

      if calor > 0
        custo += CUSTO_LIGAR if prepara_compressor

        calor.times do
          Hardware.reduz_um_grau
          custo += CUSTO_USO
        end

        nova_temperatura = temperatura_inicial - calor
      else
        nova_temperatura = temperatura_inicial
      end

      # "A sua função deve ainda retornar uma tupla com
      # a temperatura final e o custo da redução de temperatura."
      [nova_temperatura, custo]
    end

    private

    def prepara_compressor
      @compressor_ligado = true unless @compressor_ligado
    end

  end
end
