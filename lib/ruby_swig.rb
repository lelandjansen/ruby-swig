# frozen_string_literal: true
require "HelloWorld"

module RubySwig
  module_function
  def hello_world
    puts HelloWorld.hello_world()
  end
end
