# encoding: UTF-8

require_relative 'spec_helper'

describe Simulacao do
  describe "executa" do
    it "deve imprimir saída do caso exemplo" do
      proc { Simulacao.executa }.must_output("Temperatura: 22.0\nCusto total: 19.3\n")
    end
  end
end

