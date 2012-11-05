# encoding: UTF-8
require_relative 'spec_helper'

describe ACME::Hardware do

  it "deve ter o método 'reduz_um_grau'" do
    ACME::Hardware.must_respond_to :reduz_um_grau
  end

end
