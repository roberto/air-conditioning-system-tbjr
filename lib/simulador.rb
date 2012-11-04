require_relative 'condicionador'

class Simulador

  def self.refrigera(temperatura_atual, temperatura_desejada, minutos = 0, variacao = 0)
    condicionador = Condicionador.new(temperatura_atual, temperatura_desejada)

    condicionador.reajusta
    minutos.times do
      condicionador.aumenta_temperatura(variacao)
      condicionador.reajusta
    end

    [condicionador.temperatura, condicionador.custo.round(2)]
  end

end
