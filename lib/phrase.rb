# frozen_string_literal: true

# Phrase
class Phrase
  def initialize(phrase)
    @phrase = phrase
    @type = 'phrase'
  end

  attr_reader :phrase, :type
end
