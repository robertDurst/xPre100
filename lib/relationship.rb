# frozen_string_literal: true

# Relationship
class Relationship
  def initialize(phrase1, phrase2)
    @phrase1 = phrase1
    @phrase2 = phrase2
    @type = 'relationship'
  end

  attr_reader :phrase1, :phrase2, :type
end
