require_relative 'acme'

temperatura_inicial = 30
temperatura_ideal = 20
minutos = 360
variacao = 0.5

ar_condicionado = ArCondicionado.new(temperatura_inicial, temperatura_ideal)

ar_condicionado.reajusta
minutos.times do
  ar_condicionado.aumenta_temperatura(variacao)
  ar_condicionado.reajusta
end

puts ar_condicionado.temperatura.round(2)
puts ar_condicionado.custo_total.round(2)
