# frozen_string_literal: true

require_relative './simple_compilation_engine'

# CompilationEngineFactory
module CompilationEngineFactory
  def self.create(version)
    case version
    when 0
      SimpleCompilationEngine.new
    else
      raise "Unrecognized compilation engine version: #{version}."
    end
  end
end
