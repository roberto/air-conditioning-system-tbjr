# encoding: UTF-8

require_relative 'spec_helper'
require_relative '../lib/simulador'

describe Simulador do
  describe "refrigera" do
    context "temperatura inicial 30, ideal 26.5" do
      before do
        @saida = Simulador.refrigera(30, 26.5)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 28
      end

      it "deve retornar custo" do
        @saida[1].must_equal 0.7
      end
    end

    context "temperatura inicial 30, ideal 20" do
      before do
        @saida = Simulador.refrigera(30, 20)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 22
      end

      it "deve retornar custo" do
        @saida[1].must_equal 1.3
      end
    end

    context "temperatura inicial 30, ideal 20, " do
      before do
        @saida = Simulador.refrigera(30, 20)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 22
      end

      it "deve retornar custo" do
        @saida[1].must_equal 1.3
      end
    end

    context "temperatura inicial 22(tolerável), ideal 20, esquentando 1 por 5 minutos" do
      before do
        @saida = Simulador.refrigera(22, 20, 5, 1)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 22
      end

      it "deve retornar custo" do
        @saida[1].must_equal 1.0
      end
    end

    context "temperatura inicial 30, ideal 20, esquentando 1 por 5 minutos" do
      before do
        @saida = Simulador.refrigera(22, 20, 5, 1)
      end

      it "deve retornar temperatura 29" do
        @saida[0].must_equal 22
      end

      it "deve retornar custo" do
        @saida[1].must_equal 1.0
      end
    end
  end
end
