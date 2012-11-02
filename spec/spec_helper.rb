if ENV['coverage'] == 'ON'
  require 'simplecov'
  SimpleCov.start do
    add_filter "/spec/"
  end
end

require 'minitest/autorun'

module MiniTest
  class Spec
    class << self
      alias_method :context, :describe
    end
  end
end
