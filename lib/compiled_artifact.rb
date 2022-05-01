# frozen_string_literal: true

# CompiledArtifact
class CompiledArtifact
  def initialize(concepts)
    @concepts = concepts
  end

  attr_reader :concepts
end
