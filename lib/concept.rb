# frozen_string_literal: true

# Concept
class Concept
  def initialize(phrase_or_relationship)
    @phrase_or_relationship = phrase_or_relationship
  end

  attr_reader :phrase_or_relationship
end
