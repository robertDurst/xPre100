# frozen_string_literal: true

require_relative './concept'
require_relative './phrase'
require_relative './relationship'

# SimpleCompilationEngine
class SimpleCompilationEngine
  def parse(input)
    # remove all punctuation, note that apostrophes should not be replace by spaces
    prose_words = input
                  .gsub(/[^a-z0-9\s']/i, ' ')
                  .gsub(/'/i, '')
                  .scan(/\w+/)

    parse_concepts(prose_words)
  end

  private

  def parse_concepts(prose_words)
    concepts = []
    while !prose_words.nil? && prose_words.any?
      concept, prose_words = parse_concept(prose_words)
      concepts.append(concept) if !concept.nil?
    end

    concepts
  end

  def parse_concept(prose_words)
    return nil if prose_words.nil? || prose_words.none?

    # interesting
    if uppercase? prose_words[0]

      # get first phrase
      phrase1, prose_words = parse_phrase(prose_words)

      # if no connector, just a linked phrase, not a relationship
      return [Concept.new(phrase1), prose_words] unless next_is_arrow? prose_words

      # otherwise we have a relationship
      phrase2, prose_words = parse_phrase(prose_words[2..-1])

      [Concept.new(Relationship.new(phrase1, phrase2)), prose_words]
    # uninteresting, skip this word
    else
      parse_concept(prose_words[1..-1])
    end
  end

  def parse_phrase(prose_words)
    phrase = [prose_words[0]]
    i = 1
    until i >= prose_words.size || !uppercase?(prose_words[i])
      phrase.append(prose_words[i])
      i += 1
    end

    [Phrase.new(phrase.join(' ')), prose_words[i..-1]]
  end

  def next_is_arrow?(prose_words)
    prose_words.size >= 2 && prose_words[0] == 'is' && prose_words[1] == 'a'
  end

  def uppercase?(word)
    word == word.upcase
  end
end
