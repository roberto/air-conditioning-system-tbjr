# encoding: UTF-8

require_relative 'spec_helper'
require_relative '../lib/condicionador'

describe Condicionador do
  describe "reajusta" do
    before do
      @condicionador = Condicionador.new(30,27)
    end
    it "deve reduzir a temperatura em 1 grau" do
      temperatura_inicial = @condicionador.temperatura
      @condicionador.reajusta
      @condicionador.temperatura.must_equal(temperatura_inicial - 1)
    end

    it "deve contabilizar o custo de ligar + custo de uso na primeira vez" do
      @condicionador.reajusta
      @condicionador.custo.must_equal Condicionador::CUSTO_LIGAR + Condicionador::CUSTO_USO
    end

    context "após ligar compressor" do
      before do
        @condicionador.reajusta
        @condicionador.aumenta_temperatura(1)
      end
      it "deve contabilizar apenas o custo do uso" do
        custo_inicial = @condicionador.custo
        @condicionador.reajusta
        @condicionador.custo.must_equal(custo_inicial + Condicionador::CUSTO_USO)
      end
    end
  end


end
