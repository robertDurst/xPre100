# frozen_string_literal: true

# Arrow
class Arrow
  def initialize(label)
    @id = self
    @label = label
  end

  def ==(other)
    other.class == self.class && other.label == @label
  end

  attr_reader :id, :label
end
