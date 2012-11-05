# encoding: UTF-8

require_relative 'spec_helper'

class ReguladorMock
  attr_reader :contador
  def initialize
    @contador = 0
  end
  def refrigera(*args)
    @contador += 1
    [@contador/10.to_f, 10]
  end
end

describe ACME::ArCondicionadoSimulador do
  let(:regulador) { ReguladorMock.new }
  let(:simulador) { ACME::ArCondicionadoSimulador.new(regulador) }

  describe "executa" do
    before do
      @temperatura, @custo = simulador.executa
    end

    it "deve executar refrigera 361 vezes" do
      regulador.contador.must_equal 361
    end

    it "deve retornar a última temperatura registrada" do
      @temperatura.must_be_close_to 36.1
    end

    it "deve retornar a soma dos custos retornados por refrigera" do
      @custo.must_equal 3610
    end
  end

end
