# frozen_string_literal: true

require_relative './arrow'
require_relative './noun'

# The CompilationEngine takes some unstructured, prose and returns annotated
# and structured text such that we can store, manipulate, etc. in a meaningful
# way.
class CompilationEngine
  def phase_0(prose_input)
    # remove all punctuation
    prose_input_no_punctuation = prose_input.gsub(/[^a-z0-9\s]/i, '')

    # split up all words
    prose_words = prose_input_no_punctuation.scan(/\w+/)

    prose_words
  end

  def phase_1(prose_words)
    lex_words = []

    words.each do |word|
      lex_word = phase_1_parse_word(word)
      lex_words.append(lex_word)
    end

    lex_words
  end

  def phase_2(prose_lexicons)
  end

  private

  def phase_1_parse_word(word)
    return phase_1_parse_object(word) if /[[:upper:]]/.match(word[0])

    phase_1_parse_arrow word
  end

  def phase_1_parse_object(word)
    Noun.new word
  end

  def phase_1_parse_arrow
    Arrow.new word
  end

  def phase_2_parse_relationship(words)
  end

  def phase_2_parse_phrase(words)
  end
end
