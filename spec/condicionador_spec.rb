require_relative 'spec_helper'
require_relative '../lib/condicionador'

describe Condicionador do
  describe "reduz_um_grau" do
    before do
      @condicionador = Condicionador.new(30,20)
    end
    it "deve reduzir a temperatura em 1 grau" do
      temperatura_inicial = @condicionador.temperatura
      @condicionador.reduz_um_grau
      @condicionador.temperatura.must_equal (temperatura_inicial - 1)
    end

    it "deve aumentar o custo em 0.5 na primeira vez" do
      @condicionador.reduz_um_grau
      @condicionador.custo.must_equal 0.6
    end

    context "em uso" do
      before do
        @condicionador.reduz_um_grau
        @condicionador.reduz_um_grau
      end
      it "deve aumentar o custo em 0.1" do
        custo_inicial = @condicionador.custo
        @condicionador.reduz_um_grau
        @condicionador.custo.must_equal (custo_inicial + 0.1)
      end
    end
  end

  describe "refrigera" do
    context "temperatura inicial 30, final 26.5" do
      before do
        @saida = Condicionador.refrigera(30, 26.5)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 28
      end

      it "deve retornar custo" do
        @saida[1].must_equal 0.7
      end
    end

    context "temperatura inicial 30, final 20" do
      before do
        @saida = Condicionador.refrigera(30, 20)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 22
      end

      it "deve retornar custo" do
        @saida[1].must_equal 1.3
      end
    end
  end

end
