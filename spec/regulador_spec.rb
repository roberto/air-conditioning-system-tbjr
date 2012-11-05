# encoding: UTF-8

require_relative 'spec_helper'

describe ACME::Regulador do
  before do
    @regulador = ACME::Regulador.new
  end

  describe "refrigera" do
    context "já na temperatura ideal" do
      before do
        @temperatura_final, @custo = @regulador.refrigera(30,30)
      end
      it "não deve alterar temperatura" do
        @temperatura_final.must_be_close_to 30
      end

      it "custo total deve ser zero" do
        @custo.must_be_close_to 0
      end
    end

    context "com apenas 2.5 graus a mais" do
      before do
        @temperatura_final, @custo = @regulador.refrigera(32.5,30)
      end
      it "deve diminuir um grau" do
        @temperatura_final.must_be_close_to 31.5
      end

      it "custo total deve ser 0.6(compressor + 1 uso)" do
        @custo.must_be_close_to 0.6
      end
    end

    context "com 12.5 graus a mais" do
      before do
        @temperatura_final, @custo = @regulador.refrigera(52.5,40)
      end
      it "deve diminuir 10 graus" do
        @temperatura_final.must_be_close_to 41.5
      end

      it "custo total deve ser 1.6(compressor +  11 usos)" do
        @custo.must_be_close_to 1.6
      end
    end

    context "com 10 graus a mais" do
      before do
        @temperatura_final, @custo = @regulador.refrigera(30,20)
      end
      it "deve diminuir um grau" do
        @temperatura_final.must_be_close_to 22
      end

      it "custo total deve ser 1.3(compressor + 8 usos)" do
        @custo.must_be_close_to 1.3
      end
    end
  end
end
