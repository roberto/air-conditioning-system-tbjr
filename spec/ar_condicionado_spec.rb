require_relative 'spec_helper'

describe ACME::ArCondicionado do
  before do
    @regulador = MiniTest::Mock.new
    @ar_condicionado = ACME::ArCondicionado.new(25,20, @regulador)
  end

  describe "reajusta" do
    before do
      @nova_temperatura = 20
      @novo_custo = 10
      @regulador.expect :refrigera, [@nova_temperatura, @novo_custo], [25, 20]
    end

    it "deve chamar refrigera com a temperatura inicial e ideal declaradas" do
      @ar_condicionado.reajusta
      @regulador.verify
    end

    it "atualizar a temperatura" do
      @ar_condicionado.reajusta
      @ar_condicionado.temperatura.must_be_close_to @nova_temperatura
    end

    it "incrementar custo total" do
      custo_inicial = @ar_condicionado.custo_total
      @ar_condicionado.reajusta
      @ar_condicionado.custo_total.must_be_close_to(custo_inicial + @novo_custo)
    end
  end

  describe "aumenta_temperatura(variacao)" do
    it "deve incrementar temperatura de acordo com variacao" do
      @ar_condicionado.aumenta_temperatura(15)
      @ar_condicionado.temperatura.must_be_close_to 40
    end
  end

end
